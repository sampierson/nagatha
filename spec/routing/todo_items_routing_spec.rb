require "spec_helper"

describe TodoItemsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/todo_items" }.should route_to(:controller => "todo_items", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/todo_items/new" }.should route_to(:controller => "todo_items", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/todo_items/1" }.should route_to(:controller => "todo_items", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/todo_items/1/edit" }.should route_to(:controller => "todo_items", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/todo_items" }.should route_to(:controller => "todo_items", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/todo_items/1" }.should route_to(:controller => "todo_items", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/todo_items/1" }.should route_to(:controller => "todo_items", :action => "destroy", :id => "1")
    end

  end
end
