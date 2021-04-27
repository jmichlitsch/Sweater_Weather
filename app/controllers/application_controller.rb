class ApplicationController < ActionController::API

  rescue_from ActionController::ParameterMissing, with: :render_missing_parameter
  rescue_from ArgumentError, with: :render_invalid_parameters
  rescue_from NoMethodError, with: :render_not_found
  rescue_from JSON::ParserError, with: :render_unavailable

  def render_invalid_parameters(error = 'location is required')
    render json: ErrorSerializer.serialize(error), status: :bad_request
  end

  def render_not_found
    render json: ErrorSerializer.serialize('location not found'), status: :not_found
  end

  def render_unavailable
    render json: ErrorSerializer.serialize('external API unavailable'), status: :service_unavailable
  end

  def render_invalid_headers
   render json: ErrorSerializer.serialize('invalid content type'), status: :bad_request
 end

 def validate_headers
   content_type_json = request.content_type == 'application/json'
   accept_json = request.accept == 'application/json'
   render_invalid_headers unless content_type_json && accept_json
 end

 def render_missing_parameter(error)
    render json: ErrorSerializer.serialize(error.message), status: :bad_request
  end

  def reject_query_parameters
    return if request.query_parameters.blank?
    render_invalid_parameters('parameters must be sent in the body of the request')
  end
end
