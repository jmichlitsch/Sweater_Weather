class Api::V1::SalarieController < ApplicationController

  def show
    if params[:destination].present?
      jobs = TeleportFacade.get_salary(params[:destination])
      render json: TelecastSerializer.new(jobs)
    else
      render_invalid_parameters
    end
  end
end
