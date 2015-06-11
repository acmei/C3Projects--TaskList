require 'sqlite3'


module TaskList
  class Actions < Database	

  	def self.new_task(new_task, new_desc, new_comp_date)
  		db = SQLite3::Database.open "./db/tasks.db"	
  		db.execute "INSERT INTO tasks(task, desc, comp_date) VALUES(\"#{new_task}\", \"#{new_desc}\", \"#{new_comp_date}\");"
  		db.close if db
  	end

  end
end

