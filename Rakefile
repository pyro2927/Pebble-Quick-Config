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
  
  desc "Test unicorn"
  task :unicorn do
    system %{foreman start}
  end
end

desc "Install"
task :install do
  puts "Installing required gem files..."
  sh "bundle install --path vendor/bundle"
end

desc "Sync static files to Amazon S3"
task :s3sync do
  system "find . -name '.DS_Store' -print -delete"
  require 'yaml'
  $PREFS = YAML.load_file('./config/prefs.yml') || {}
  if $PREFS.has_key?('s3_bucket')
    s3_bucket = $PREFS['s3_bucket']
    s3_path = $PREFS['s3_path'] || '/'
    sync_path = $PREFS['sync_path'] || 'public/'
    system "s3cmd -P -M --delete-removed sync #{sync_path} s3://#{s3_bucket}#{s3_path}/"
  else
    puts "Please define: s3_bucket"
  end
end