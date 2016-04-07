# -*- encoding: utf-8 -*-
require 'sinatra/base'
require 'yaml'
require 'bourbon'

class MyApp < Sinatra::Base

  get '/' do
    slim :index
  end

  get '/config' do
    @title = params[:title]
    @fields = params[:fields].split(",")
    slim :index
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
