require 'sqlite3'

db = SQLite3::Database.new "./db/tasks.db"

db.execute "CREATE TABLE tasks(id INTEGER PRIMARY KEY, task TEXT NOT NULL, desc TEXT, comp_date TEXT);"

db.close if db
