class Api::V1::InstagramController < ApplicationController
  include NestedHash

  protect_from_forgery with: :null_session
  before_filter :authenticate_from_token

  def confirm
    render json: params["hub.challenge"], status: :ok
  end

  def update
    InstagramUploader.new(nested_hash_value(params,'media_id')).create_post

    render json: :nothing, status: :ok
  end

  private

  def authenticate_from_token
    Rails.logger.info(params)
    unless params['hub.verify_token'] == Rails.application.secrets.instagram_token
      render text: 'Invalid token', status: :unauthorized
    end
  end
end