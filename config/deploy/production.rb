set :deploy_to, '/home/rails/fly_mama'
set :tmp_dir, "/home/rails/tmp"

server '46.101.216.40', user: 'rails', roles: %w{app web db}

namespace :deploy do

  task :restart do
    on roles(:all) do
      execute 'sudo service unicorn restart'
    end
  end

  after :publishing, 'deploy:restart'

end