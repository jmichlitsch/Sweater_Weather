class Api::V1::SalarieController < ApplicationController

  def show
    if params[:destination].present?
      jobs = TeleportFacade.get_salary(params[:destination])
      binding.pry
      render json: TelecastSerializer.new(jobs)
      binding.pry
    else
      render_invalid_parameters
    end
  end
end
