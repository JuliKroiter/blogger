require 'koala'

class Facebook
  class << self
    attr_reader :client, :updates

    def client
      Koala::Facebook::API.new(
        Rails.application.secrets.facebook_token,
        Rails.application.secrets.facebook_secret
      )
    end

    def updates
      Koala::Facebook::RealtimeUpdates.new(
        app_id: Rails.application.secrets.facebook_client_id,
        secret: Rails.application.secrets.facebook_secret
      )
    end
  end
end