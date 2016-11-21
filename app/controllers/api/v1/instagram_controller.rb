class Api::V1::InstagramController < ApplicationController
  protect_from_forgery with: :null_session

  def confirm
    render json: params["hub.challenge"], status: :ok
  end

  def update
    Rails.logger.info('________________________INSTAGRAM__________________________________')
    Rails.logger.info(params)
    render json: params["hub.challenge"], status: :ok
  end
end