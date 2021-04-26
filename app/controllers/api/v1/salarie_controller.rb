class Api::V1::SalarieController < ApplicationController

  def show
    if params[:destination].present?
      destination = TeleportService.call(params[:destination])
    else
      render_invalid_parameters
    end
  end
end
