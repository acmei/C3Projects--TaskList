require 'sqlite3'

module TaskList
  class Actions < Database	

    # adds a task record to existing database 'tasks.db'
  	def new_task(new_task, new_desc, new_comp_date)
      statement = "INSERT INTO tasks(task, desc, comp_date) 
                  VALUES(\"#{new_task}\", \"#{new_desc}\", \"#{new_comp_date}\");"
      query!(statement)
  	end

  	def all_tasks
  		statement = "SELECT * FROM tasks"
  		query!(statement)
  	end

    def task_complete(finished_tasks_array, new_comp_date)

      finished_tasks_array.each do |finished_task|
        statement = "UPDATE tasks SET comp_date=\"#{new_comp_date}\" where task=\"#{task}\";"
      end
    end

  end
end

