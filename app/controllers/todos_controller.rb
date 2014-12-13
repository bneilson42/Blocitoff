class TodosController < ApplicationController
  def index
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def new
    @todo = Todo.new
    authorize @todo
  end
end
