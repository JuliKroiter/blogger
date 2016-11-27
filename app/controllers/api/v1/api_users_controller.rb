class Api::V1::ApiUsersController < Api::V1::BaseController
  skip_before_filter :authenticate

  api :POST, '/users', 'Authenticate user in system'
  formats ['json']
  def create
    user = ApiUser.create(ip: request.remote_ip)

    render json: user, only: [:api_key, :auth_token], status: 201
  end
end