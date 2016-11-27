class Api::V1::InstagramController < ApplicationController
  protect_from_forgery with: :null_session
  include NestedHash

  protect_from_forgery with: :null_session

  def confirm
    render json: params["hub.challenge"], status: :ok
  end

  def update
    InstagramUploader.new(nested_hash_value(params,'media_id')).create_post

    render json: :nothing, status: :ok
  end
end