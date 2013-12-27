# -*- encoding: utf-8 -*-
require 'sinatra/base'
require 'sinatra/content_for'
require 'yaml'
require 'bourbon'
require './libs/helpers'

$PREFS = YAML.load_file('./config/prefs.yml') || {}

class MyApp < Sinatra::Base
  helpers TemplateHelpers
  helpers Sinatra::ContentFor

  configure do
    set :s3_config, "http://#{$PREFS['s3_bucket']}.s3.amazonaws.com#{$PREFS['s3_path']}" if $PREFS.has_key?("s3_bucket") && $PREFS.has_key?("s3_path")
    set :google_analytics_id, "#{$PREFS['google_analytics_id']}" if $PREFS.has_key?("google_analytics_id")
  end
  before do
    @s3_prefix = settings.development? ? "" : settings.s3_config if settings.respond_to?("s3_config")
  end
  get '/' do
    erb :index
  end

  get '/config' do
    @title = params[:title]
  end

  get %r{/(sass|scss)/([\w]+)\.(?:sass|scss)} do
    content_type :css
    if params[:captures].first == "sass"
      sass params[:captures][1].to_sym, :layout => false, :views => "#{settings.root}/#{params[:captures].first}"
    else
      scss params[:captures][1].to_sym, :layout => false, :views => "#{settings.root}/#{params[:captures].first}"
    end
  end
end
