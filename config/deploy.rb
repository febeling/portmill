set :application, "portmill"
set :repository,  "git://github.com/langalex/portmill.git"

set :deploy_to, "/opt/var/www/#{application}"

set :admin_runner, "febeling"
set :runner, "portmill"

set :use_sudo, true

set :scm, :git

server = ENV['PORTMILL_HOST'] || abort("Please set PORTMILL_HOST")
role :app, server
role :web, server
role :db, server, :primary => true

namespace :passenger do
  desc "Restart Application"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end
end

after :deploy, "passenger:restart"
