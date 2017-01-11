class Api::V1::FacebookController < ApplicationController
  protect_from_forgery with: :null_session

  def confirm
    render json: params["hub.challenge"], status: :ok
  end

  def update
    if params['entry']
      @user = User.joins(:providers).find_by(providers: {provider: 'facebook', uid: params[:entry]["id"]})
      FacebookUploader.new(@user).upload if @user
    end

    render json: :nothing, status: :ok
  end
end
