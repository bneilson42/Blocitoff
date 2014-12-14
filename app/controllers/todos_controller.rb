class TodosController < ApplicationController
  def index
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
    #authorize @todo
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :time_left)
  end
end
