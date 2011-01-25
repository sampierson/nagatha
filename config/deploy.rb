require 'bundler/capistrano'

set :application, "nagatha"
set :repository,  "git@github.com:sampierson/nagatha.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :use_sudo, false
#set :branch, 'master'
#set :git_shallow_clone, 1
set :deploy_via, :remote_cache
#set :copy_compression, :bz2
#set :rails_env, 'production'
#set :deploy_to, "/home/dhusername/#{application}"

role :web, "nagatha.com"                   # Your HTTP server, Apache/etc
role :app, "nagatha.com"                   # This may be the same as your `Web` server
role :db,  "nagatha.com", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

after "deploy:update_code" do
  run "ln -fs #{deploy_to}/#{shared_dir}/db/production.sqlite3 #{release_path}/db/production.sqlite3"
  run "ln -fs #{deploy_to}/#{shared_dir}/config/smtp_settings.yml #{release_path}/config/smtp_settings.yml"
end

namespace :deploy do
  # If you are using Passenger mod_rails uncomment this:
  # if you're still using the script/reapear helper you will need
  # these http://github.com/rails/irs_process_scripts
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
