#  How can we disable the Ferret gem in the vendor/gem directory?

set :application, "joke_machine"
set :repository, "git@github.com:aantix/Turkee-Iterator.git"
set :scm, "git"
set :deploy_to, "/var/www/rails/turkee_iterator"
set :user, "root"
set :use_sudo, false

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "textmatch.me"
role :web, "textmatch.me"
role :db,  "textmatch.me", :primary => true

namespace :deploy do
  desc "Restarting Passenger with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{current_path}/tmp/restart.txt"
  end

  [:start, :stop].each do |t|
    desc "#{t} task is a no-op with Passenger"
    task t, :roles => :app do ; end
  end
end

namespace :site do
  
  desc "Change the deployment dir ownership to Apache." 
  task :chown do
    run "cd #{current_path} && chown -R apache *"
  end

end

after :deploy, "site:chown"
after :deploy, "deploy:cleanup"   # Only keep the last five releases around.
