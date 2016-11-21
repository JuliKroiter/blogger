require "instagram"

Instagram.configure do |config|
  config.client_id = Rails.application.secrets.instagram_client_id
  config.access_token = Rails.application.secrets.instagram_token
  config.client_secret = Rails.application.secrets.instagram_secret
end