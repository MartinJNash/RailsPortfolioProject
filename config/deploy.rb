require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'    # for rvm support. (http://rvm.io)
# require 'mina/puma'

# Basic settings:
#   domain       - The hostname to SSH to.
#   deploy_to    - Path to deploy into.
#   repository   - Git repo to clone from. (needed by mina/git)
#   branch       - Branch name to deploy. (needed by mina/git)

set :domain, '107.170.239.101'
set :deploy_to, '/apps/test_baba'
set :repository, 'https://github.com/MartinJNash/RailsPortfolioProject.git'
set :branch, 'master'



set :pid_file, '/var/run/test_baba.pid'
set :sock_file, 'unix:///var/run/test_baba.sock'



# Manually create these paths in shared/ (eg: shared/config/database.yml) in your server.
# They will be linked in the 'deploy:link_shared_paths' step.
set :shared_paths, ['config/database.yml', 'log']

# Optional settings:
set :user, 'root'    # Username in the server to SSH to.
set :ssh_options, '-A'


task :environment do
  set :rvm_path, "/usr/local/rvm/bin/rvm"
  invoke :'rvm:use[ruby-2.0.0-p353@default]'
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task :setup => :environment do
  queue! %[mkdir -p "#{deploy_to}/shared/log"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/log"]

  queue! %[mkdir -p "#{deploy_to}/shared/config"]
  queue! %[chmod g+rx,u+rwx "#{deploy_to}/shared/config"]

  queue! %[touch "#{deploy_to}/shared/config/database.yml"]
  queue  %[echo "-----> Be sure to edit 'shared/config/database.yml'."]
end

desc "Deploys the current version to the server."
task :deploy => :environment do
  deploy do
    # Put things that will set up an empty directory into a fully set-up
    # instance of your project.
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'

    to :launch do
      queue "touch #{deploy_to}/tmp/restart.txt"
    end
  end
end




task :down do
  invoke :restart
  invoke :logs
end

task :restart => :environment do
  invoke :stop
  invoke :start
end

task :logs do
  queue 'tail -f /var/log/nginx/error.log'
  # queue 'tail -f /var/log/nginx/access.log'
end

task :stop => :environment do
  queue 'nginx -s stop'
  queue %[kill -9 `cat #{pid_file}`]
end

task :start => :environment do
  queue "cd #{deploy_to}; puma -e production -d --pidfile #{pid_file} -b #{sock_file}"
  queue 'nginx'
end

# For help in making your deploy script, see the Mina documentation:
#
#  - http://nadarei.co/mina
#  - http://nadarei.co/mina/tasks
#  - http://nadarei.co/mina/settings
#  - http://nadarei.co/mina/helpers

