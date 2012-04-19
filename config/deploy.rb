# RVM bootstrap
$:.unshift(File.expand_path("~/.rvm/lib"))

set :application, "enod.org"
set :repository,  "git@github.com:EnOD/enod.org.git"

set :scm, :git
set :branch, "master"

set :git_shallow_clone, 1
set :deploy_via, :checkout
set :deploy_to, "~/web/enod.org"

default_run_options[:pty] = true

set :user, "enod"
set :use_sudo, false

server "guki.org", :app, :web, :db, :primary => true


set :whenever_roles, :cron
set :whenever_environment, defer { stage }

after "deploy:update", 'deploy:symlink'
after "deploy:symlink", 'deploy:bundle'
# after "deploy:bundle", 'deploy:whenever'
after "deploy", "deploy:cleanup"


namespace :deploy do
  task :symlink do
    run "rm -Rf #{release_path}/log"
    run "rm -Rf #{release_path}/public/remote"
    run "rm -Rf #{release_path}/public/assets"
    run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"
    run "ln -nfs /home/user/sites_media #{release_path}/public/remote"

    run "ln -nfs #{shared_path}/log #{release_path}/log"
    run "ln -nfs #{shared_path}/sockets #{release_path}/tmp/sockets"
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
    run "ln -nfs #{shared_path}/config/active_api.yml #{release_path}/config/active_api.yml"
    run "ln -nfs #{shared_path}/config/omniauth.yml #{release_path}/config/omniauth.yml"
  end

  task :bundle do
    run "cd #{deploy_to}/current && bundle install"
  end

  task :assets do
    # mv assets/* /home/user/apps/demoform/shared/assets/
    #run "ln -nfs #{shared_path}/assets #{release_path}/public/assets"

    #run "cd #{deploy_to}/current && bundle exec rake assets:clean"
    # run "cd #{deploy_to}/current && bundle exec rake assets:clean"
    # run "cd #{deploy_to}/current && bundle exec rake assets:precompile"

    # run "rm -Rf #{shared_path}/assets/*"
    # run "mv #{deploy_to}/current/public/assets/* #{shared_path}/assets/"
    # run "rm -Rf #{deploy_to}/current/public/assets"
    # run "ln -nfs #{shared_path}/assets #{deploy_to}/current/public/assets"
  end
end