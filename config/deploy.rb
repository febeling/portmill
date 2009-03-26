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

# apt libxml2
# apt libxml2-dev
# apt install libxslt-dev
# gem cucumber
# gem rspec
# gem spicycode-rcov
# gem syntax
# gem hoe
# gem rspec-rails
# gem webrat
# gem json
# gem jchris-couchrest
# gem validatable
# gem mislav-will_paginate
# gem febeling-couch_potato
