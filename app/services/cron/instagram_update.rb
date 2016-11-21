class Cron::InstagramUpdate
  include Sidekiq::Worker

  def perform
    InstagramUploader.update_all
  end
end
