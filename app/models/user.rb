require 'koala'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  enum role: [:user, :admin]

  has_many :providers

  class << self
    def find_for_oauth(access_token)
      user = User.joins(:providers).find_by( providers: {
                                               provider: access_token.provider,
                                               uid: access_token.uid
                                             })

      unless user
        user = User.create(
          email: access_token.extra.raw_info.email || "change@me-#{access_token.uid}-#{access_token.provider}.com",
          password: Devise.friendly_token[0,20]
        )

        graph = Koala::Facebook::API.new(access_token.credentials.token)
        pages = graph.get_connections('me', 'accounts')
        oauth_fb_page = pages.any? ? graph.get_page_access_token(pages.first['id']) : ''

        if user.save
          user.providers.create(
            provider: access_token.provider,
            uid: access_token.uid,
            oauth_token: access_token.credentials.token,
            oauth_fb_page: oauth_fb_page

          )
        end
      end

      user
    end
  end
end
