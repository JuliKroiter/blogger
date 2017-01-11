class Cron::FacebookUpdate
  include Sidekiq::Worker

  def perform
    @user = User.joins(:providers).find_by(providers: {provider: 'facebook', uid: Rails.application.secrets.uid})
    FacebookUploader.new(@user).upload if @user
  end
end
