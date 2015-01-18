set :application, "antea"
set :repository,  "git@git.guynathan.com:guynathan/an-tea.git"

set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server = "anteacoffee.com"
role :web, server
role :app, server
role :db,  server, :primary => true

set :user, "spree"
set :deploy_to, "/home/spree/#{application}"
set :use_sudo, false
default_run_options[:shell] = '/bin/bash --login'
default_environment["RAILS_ENV"] = 'production'

task :symlink_database_yml do
  run "rm #{release_path}/config/database.yml"
  run "ln -sfn #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end
after "bundle:install", "symlink_database_yml"