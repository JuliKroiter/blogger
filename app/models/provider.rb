class Provider < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :provider, :uid, :oauth_token
end
