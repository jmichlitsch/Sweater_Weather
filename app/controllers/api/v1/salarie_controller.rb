class Api::V1::SalarieController < ApplicationController

  def show
    if params[:destination].present?
      binding.pry
      jobs = TeleportFacade.get_salary(params[:destination])
      binding.pry
    else
      render_invalid_parameters
    end
  end
end
