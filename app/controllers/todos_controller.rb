class TodosController < ApplicationController
	def index
	end

	def new
	 @todo = Todo.new
	end

	def create
	@todo = Todo.new todo_params

	if @todo.save
		redirect_to @post, notice: "Heyy! Todo was created"
	else render new notice: "sorry try next time "
	end
	end


	private 
	 def todo_params
	 	params.require(:todo).permit(:user_name,:password)
	 end
end
