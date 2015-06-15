require 'sinatra'
require 'sinatra/reloader'
require './lib/database'
require './lib/task_actions'

class TaskSite < Sinatra::Base
  register Sinatra::Reloader
  also_reload './lib/task_actions' # this isn't doing anything...


  get "/" do
    @tasks = TaskList::Actions.new("tasks.db")
    @all_tasks = @tasks.all_tasks
    erb :index
  end

  post "/" do
    @finished_tasks = params[:finished_tasks]

    @tasks = TaskList::Actions.new("tasks.db")
    @tasks.task_complete(@finished_tasks, @comp_date)

    erb :index
  end

  get "/add_task" do
    erb :add_task
  end

  post "/add_task" do
    @task       = params[:task]
    @desc       = params[:desc]
    @comp_date  = params[:comp_date]

    @tasks = TaskList::Actions.new("tasks.db")
    @tasks.new_task(@task, @desc, @comp_date)

    redirect '/'
  end

end