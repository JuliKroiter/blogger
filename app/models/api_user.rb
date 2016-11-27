class ApiUser < ActiveRecord::Base
  before_create :generate_access

  def generate_access
    self.auth_token = Digest::MD5.hexdigest(Time.now.to_i.to_s + rand(999999999).to_s)
    self.api_key = Digest::MD5.hexdigest(Time.now.to_i.to_s + rand(999999999).to_s)
  end
end
