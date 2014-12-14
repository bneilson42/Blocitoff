class TodosController < ApplicationController
  def index
    @todos = current_user.todos
    #authorize @todos
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
    #authorize @todos
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :time_left)
  end
end
