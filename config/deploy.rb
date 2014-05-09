# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'BoocLeas'
set :repo_url, 'git@github.com:slp-cem/book_admin.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call
set :branch, 'install_cap'

# Default deploy_to directory is /var/www/my_app
#set :deploy_to, '/var/www/my_app'
set :deploy_to, "/home/usr/assist/_ookawa/tmp/release_test/boocleas"

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true
# Default value for :linked_files is []
set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :default_env, { rails_env: "production" }

# Default value for keep_releases is 5
set :keep_releases, 5

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  desc 'upload important files'
  task :upload do
    on roles(:app) do |host|
      upload!('config/database.yml',"#{shared_path}/config")
    end
  end

  # サーバ更新時にキャッシュを削除する
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wailt: 10 do
      within release_path do
        execute :rm, '-rf', release_path.join("tmp/cache")
      end
    end
  end

  before "deploy:check:linked_files", 'deploy:upload'
  # after :finishing, 'deploy:cleanup'
end
