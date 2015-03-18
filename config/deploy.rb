lock '3.4.0'

set :application, 'pomodoro_panel'
set :repo_url, 'https://github.com/diegorubin/pomodoro_panel.git'
server 'monitor', user: 'walmart', roles: %{app}
set :deploy_to, '/applications/pomodoro_panel'

namespace :deploy do
  after :restart, :clear_cache do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :deploy, 'deploy:restart'
end

