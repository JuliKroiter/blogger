class Api::V1::FacebookController < ApplicationController
  protect_from_forgery with: :null_session

  def confirm
    render json: params["hub.challenge"], status: :ok
  end

  def update
    Rails.logger.info("************************************* PARAMS ******************************************************")
    Rails.logger.info(params)
    Rails.logger.info("************************************* PARAMS ******************************************************")
    render json: :nothing, status: :ok
  end
end