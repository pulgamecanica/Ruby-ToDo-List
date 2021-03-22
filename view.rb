class View 
	def home_menu
		puts
		puts '-'*20
		puts '1 - Show all tasks'
		puts '2 - Add a new task'
		puts '3 - Delete a task'
		puts '4 - Complete a task'
		puts '5 - Uncomplete a task'
		puts '0 - EXIT'
		puts '-'*20
		puts
		print 'Please, choose an option: '
		gets.to_i
	end
	def show_tasks(tasks_list)
		if !tasks_list.empty?
			puts 'List: '
			tasks_list.each_with_index do |task, counter|
				puts "#{counter}.- [#{task.status ? 'X' : ' '}]....#{task.description}"
			end
		else
			puts '-*Sorry: There are currently no tasks*-'
		end
	end

	def create_new_task
		print 'Please enter a description for this task: '
		gets.chomp
	end

	def delete_task
		print 'Choose the ID of the Task to Delete: '
		gets.to_i
	end

	def complete_task
		print 'Choose the ID of the Task you want to complete: '
		gets.to_i
	end
	
	def uncomplete_task
		print 'Choose the ID of the Task you want to uncomplete: '
		gets.to_i
	end
end