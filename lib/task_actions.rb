require 'sqlite3'


module TaskList
  class Actions < Database	

  	def new_task(new_task, new_desc, new_comp_date)
      statement = "INSERT INTO tasks(task, desc, comp_date) 
                  VALUES(\"#{new_task}\", \"#{new_desc}\", \"#{new_comp_date}\");"
      query!(statement)
  	end

  end
end

