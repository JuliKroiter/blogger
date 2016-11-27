class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :authenticate
  before_action :destroy_session

  rescue_from ActiveRecord::RecordNotFound, with: lambda { render json: { :error => 'Record not found' }, :status => 404 }

  def catch_404
    respond_to do |format|
      format.xml { render xml: { :error => 'Not found' }, :status => 404 }
      format.json { render json: { :error => 'Not found' }, :status => 404 }
      format.html  { render file: 'public/404.html', :status => 404 }
    end
  end

  def destroy_session
    request.session_options[:skip] = true
  end

  protected

  def authenticate
    user = ApiUser.find_by(api_key: params[:api_key])

    unless user
      render_unauthorized('Invalid api key')
    else
      unless params[:auth_token] and ActiveSupport::SecurityUtils.secure_compare(user.auth_token, params[:auth_token])
        render_unauthorized('Invalid access token')
      end
    end

    user
  end

  def render_unauthorized(error_type)
    self.headers['WWW-Authenticate'] = "#{error_type}m='Application'"
    render json: "Bad credentials.#{error_type}", status: 401
  end
end