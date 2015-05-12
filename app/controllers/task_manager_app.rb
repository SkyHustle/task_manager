require 'sinatra'

class TaskManagerApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  # initially :root = "app/controllers/.."
  # after set :root = "./.."
# require 'pry'; binding.pry
  get '/' do
    "Hello World"
  end
end