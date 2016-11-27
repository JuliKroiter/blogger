Apipie.configure do |config|
  config.app_name                = "Blogger"
  config.api_base_url            = "api/v1"
  config.doc_base_url            = "/api_docs"
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/api/**/*.rb"
end
