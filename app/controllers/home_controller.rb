class HomeController < ApplicationController

  def index
    redirect_to todo_items_path if user_signed_in?
  end
end
