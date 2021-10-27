class TodosController < ApplicationController
	before_action :find_todo, only: %i[show edit update destroy]
	def index
		 @todos = Todo.all
	end

	def new
	 @todo = Todo.new
	end

	def create
	@todo = Todo.new(todo_params)

	if @todo.save
		redirect_to @todo, notice: "Heyy! Todo was created"
	else render 'new', notice: "sorry try next time "
	end
	end

	 def show
	 end

	 def edit
	 end

	 def update
	 	if @todo.update(todo_params)
	 		redirect_to @todo, notice: "Heyy! Todo was updated"
	 	else render 'edit',notice: "Sorry we can't update"
	 end
	  def destroy
         	@todo.destroy
  			redirect_to todos_path, notice: "Student was successfully destroyed." 
        
    	end
  end


	private 
	 def todo_params
	 	params.require(:todo).permit(:user_name,:password)
	 end

	 def find_todo
	 	@todo = Todo.find(params[:id])
	 end
end 
