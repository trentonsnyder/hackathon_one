class TodosController < ApplicationController
  before_action :todo, except: [:index, :new, :create]

  def index
    @todos = Todo.all
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.new(todo_params)
    if @todo.save
      flash[:notice] = "Successful added item to todo list!"
      redirect_to todos_path
    else
      flash[:alert] = "Errors while saving todo item."
      render :new
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      flash[:notice] = "Successful Update!"
      redirect_to todo_path(@todo)
    else
      flash[:alert] = "Errors while saving your update..."
      render :edit
    end
  end

  def destroy
    title = @todo.title
    @todo.destroy
    flash[:notice] = "Todo Item removed successfully!"
    redirect_to todos_path
  end

  private
    def todo
      @todo = current_user.Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:title)
    end

end














