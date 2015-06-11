require 'sinatra'
require 'sinatra/reloader'
require './lib/database'
require './lib/task_actions'

class TaskSite < Sinatra::Base
  register Sinatra::Reloader
  # auto_reload "./lib/task_actions"

  get "/" do
    erb :tasks
  end

  post "/" do
  	@task = params[:task]
  	@desc = params[:desc]
  	@comp_date = params[:comp_date]

  	TaskList::Actions.new_task(@task, @desc, @comp_date)

  	erb :tasks
  end

end