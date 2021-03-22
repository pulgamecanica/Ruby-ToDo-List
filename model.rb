require 'csv'

#Task Wich has a description and a status (Compleated, on not, true/false)
class Task
	attr_reader :description
	attr_accessor :status 
	
	def initialize(description, status = false)
		@description = description
		@status = status	
	end

end
#Object to represnt a list of tasks
class Tasks_List

	attr_accessor :tasks #This represents all the tasks of the program

	def initialize 
		@tasks = read_csv_file
	end

	def read_csv_file
		tasks_array = []
		CSV.foreach('todo_list.csv') do |row| #Open and acces the csv file to read the tasks
			tasks_array << Task.new(row[1], row[0] == 'true') #Add all tasks founded on the csv file
		end
		tasks_array
	end

	def save_csv_file
		CSV.open('todo_list.csv', 'w') do |csv_file|
			tasks.each do |task|
				csv_file << [task.status, task.description]
			end
		end
	end

	def add_new_task description
		tasks << Task.new(description)
		save_csv_file
	end

	def remove_task id
		if (id > tasks.length)
				puts 'That Task does not exists'
		else
			puts "Deleted task[#{id}] - #{tasks[id].description}"
			tasks.delete_at(id)
			save_csv_file
		end
	end

	def complete_task id
		if (id > tasks.length)
				puts 'That Task does not exists'
		else
			puts "Marked task[#{id}] - #{tasks[id].description} as completed!"  
			tasks[id].status = true		
			save_csv_file
		end
	end

	def uncomplete_task id
		if (id > tasks.length)
				puts 'That Task does not exists'
		else
			puts "Marked task[#{id}] - #{tasks[id].description} as uncompleted!"  
			tasks[id].status = false		
			save_csv_file
		end
	end

end









