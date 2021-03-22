require_relative 'model.rb'
require_relative 'view.rb'

class ToDo
	attr_accessor :view, :list
	def initialize
		@view = View.new
		@list = Tasks_List.new
		engine(1)
	end

	def engine option
		case option
			when 1
				@view.show_tasks(@list.tasks)
			when 2
				task_input = @view.create_new_task
				@list.add_new_task(task_input)
			when 3
				task_input_id = @view.delete_task
				@list.remove_task(task_input_id)
			when 4
				complete_task_id = @view.complete_task
				@list.complete_task(complete_task_id)
			when 5
				uncomplete_task_id = @view.uncomplete_task
				@list.uncomplete_task(uncomplete_task_id)
			when 666
				@list.delete_all_tasks
			when 0
				puts 'Thanks, please come back later :)'
				exit
			else 
				puts 'Not a valid option :('
		end
		print '.'
		sleep(0.5)
		print '.'
		sleep(0.5)
		print '.'
		sleep(0.5)
		engine(@view.home_menu)
	end

end

ToDo.new
