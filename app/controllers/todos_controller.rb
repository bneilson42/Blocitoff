class TodosController < ApplicationController
  def index
    @todos = current_user.todos
    # authorize @todos
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
    # authorize @todo
  end

  def create
    @todo = current_user.todos.build(todo_params)
    #authorize @todo
    if @todo.save
      redirect_to todos_path, notice: 'Item created'
    else
      flash[:error] = "There was an error saving your item"
      render :new
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    #authorize @todo
    if  @todo.delete
      flash[:notice] = "Your item has been completed."
      redirect_to todos_path
    else
      flash[:error] = "There was an error deleting your item"
    end
  end


  private

  def todo_params
    params.require(:todo).permit(:description, :time_left)
  end
end
