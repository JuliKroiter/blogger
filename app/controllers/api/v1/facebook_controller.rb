class Api::V1::FacebookController < ApplicationController
  protect_from_forgery with: :null_session

  def confirm
    render json: params["hub.challenge"], status: :ok
  end

  def update
    render json: :nothing, status: :ok
  end
end