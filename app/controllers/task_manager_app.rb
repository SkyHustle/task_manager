require 'sinatra'

class TaskManagerApp < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  # initially :root = "app/controllers/.."
  # after set :root = "./.."
# require 'pry'; binding.pry
  get '/' do
    erb :dashboard
  end

  get '/tasks' do
    @tasks = ['Task1', 'Task2', 'Task3']
    erb :index  
  end

  get '/tasks/new' do
    erb :new
  end

  post '/tasks' do
    "<p>Params: #{params}</p> <p>Task params: #{params[:task]}</p>"
  end
end