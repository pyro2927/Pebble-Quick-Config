# -*- encoding: utf-8 -*-
require 'bundler'
Bundler.require
require 'sinatra/base'
require 'sinatra/content_for'

class MyApp < Sinatra::Base
  get '/' do
    "hello world"
  end
end