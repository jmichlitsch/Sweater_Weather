class Api::V1::WeatherController < ApplicationController
  def show
    forecast = WeatherFacade.forecast(params[:location])
    render json: ForecastSerializer.new(forecast)
    end
  end
