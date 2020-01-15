# frozen_string_literal: true

# config valid for current version and patch releases of Capistrano
set :application, "radipos"

set :repo_url, "git@github.com:dtanakab/radipos.git"

set :branch, "master"

set :deploy_to, "/opt/radipos"

set :rbenv_ruby, "2.6.5"

append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"
append :linked_files, "config/master.key"
