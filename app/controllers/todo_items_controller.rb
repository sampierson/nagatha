class TodoItemsController < ApplicationController
  before_filter :authenticate_user!
  helper_method :sort_column, :sort_direction

  def index
    @todo_items = current_user.todo_items.all
    @machines = TodoItem.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 20, :page => params[:page])
  end

  def new
    @todo = TodoItem.new
  end

  def edit
    @todo = TodoItem.find(params[:id])
  end

  def create
    @todo = current_user.todo_items.new(params[:todo_item])

    if @todo.save
      redirect_to(todo_items_url, :notice => "Todo item \"#{@todo.description}\" created.")
    else
      flash[:alert] = 'There was a problem creating your To Do item'
      render :action => "new"
    end
  end

  def update
    @todo = current_user.todo_items.find(params[:id])

    if @todo.update_attributes(params[:todo_item])
      redirect_to(todo_items_url, :notice => 'Todo item was successfully updated.')
    else
      flash[:alert] = 'There was a problem updating your To Do item'
      render :action => "edit"
    end
  end

  def destroy
    @todo = current_user.todo_items.find(params[:id])
    @todo.destroy

    redirect_to(todo_items_url)
  end

  private

  def sort_column
    TodoItem.column_names.include?(params[:sort]) ? params[:sort] : "position"
  end

  def sort_direction
    %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
  end
end
