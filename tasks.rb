require 'sinatra'
require 'sinatra/reloader'
require './lib/database'
require './lib/task_actions'

class TaskSite < Sinatra::Base
  register Sinatra::Reloader
  also_reload './lib/task_actions' # this isn't doing anything...
  enable :sessions


  get "/" do
    @tasks = TaskList::Actions.new("tasks.db")
    @all_tasks = @tasks.all_tasks
    erb :index
  end

  post "/" do
    session[:finished_tasks] = params[:finished_tasks]
    
    # @tasks = TaskList::Actions.new("tasks.db")
    # @tasks.task_complete(@finished_tasks)

    redirect to('/completed')
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

  get "/completed" do
    @finished_tasks = session[:finished_tasks]
    erb :comp_date
  end

  post "/completed" do

    @finished_tasks = session[:finished_tasks]

    @tasks = TaskList::Actions.new("tasks.db")

    puts @finished_tasks

    @finished_tasks.each do |fin_task|
      @new_comp_date = params[fin_task.to_sym]
      @tasks.update_comp_date(fin_task, @new_comp_date)

    end

    redirect '/'
  end

end



