class TodoItemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :load_todo_item, :except => [:index, :new, :create]
  helper_method :sort_column, :sort_direction

  def index
    @todo_items = current_user.todo_items.with_status('undone').all
    @machines = TodoItem.search(params[:search]).order(sort_column + ' ' + sort_direction).paginate(:per_page => 20, :page => params[:page])
  end

  def new
    @todo = TodoItem.new
  end

  def edit
  end

  def create
    @todo = current_user.todo_items.new(params[:todo_item])

    if @todo.save
      @todo.move_to_top
      redirect_to(todo_items_url, :notice => "Todo item \"#{@todo.description}\" created.")
    else
      flash[:alert] = 'There was a problem creating your To Do item'
      render :action => "new"
    end
  end

  def update
    if @todo.update_attributes(params[:todo_item])
      redirect_to(todo_items_url, :notice => 'Todo item was successfully updated.')
    else
      flash[:alert] = 'There was a problem updating your To Do item'
      render :action => "edit"
    end
  end

  def destroy
    @todo.destroy

    redirect_to(todo_items_url)
  end

  def move_higher
    @todo.move_higher
    redirect_to :action => :index
  end

  def move_lower
    @todo.move_lower
    redirect_to :action => :index
  end

  def done
    @todo.completed_at = Time.now
    @todo.done!
    redirect_to :action => :index
  end

  private

  def load_todo_item
    @todo = current_user.todo_items.find(params[:id])
  end

  def sort_column
    TodoItem.column_names.include?(params[:sort]) ? params[:sort] : "position"
  end

  def sort_direction
    %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
  end
end
