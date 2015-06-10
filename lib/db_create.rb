require 'sqlite3'

db = SQLite3::Database.new "./db/tasks.db"

db.execute "CREATE TABLE tasks (id INTEGER PRIMARY KEY, name TEXT NOT NULL, description TEXT, completed_date TEXT);"

db.close if db
