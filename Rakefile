# -*- encoding: utf-8 -*-
require "bundler/setup"

task :default => ["run:development"]

namespace :run do
  desc "Start server as Production"
  task :production do
    ENV['RACK_ENV'] = "production"
    puts "Running as Production..."
    sh %{shotgun -o 0.0.0.0}
  end
  
  desc "Start server as Development (local)"
  task :development do
    sh %{shotgun -o 0.0.0.0}
  end
end