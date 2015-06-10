require 'sinatra'
require 'sinatra/reloader'

class TaskList < Sinatra::Base
  register Sinatra::Reloader
  # auto_reload path/tofolder

  get "/" do
    erb :tasks
  end

  post "/" do

  	erb :tasks
  end

end