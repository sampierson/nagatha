require 'spec_helper'

describe TodoItemsController do
  fixtures :users

  context "while logged in" do
    before do
      @user = users(:confirmed_user)
      sign_in @user
    end

    context "when there are Mchines in the db" do
      before do
        @todo1 = Factory.create(:todo_item, :user => @user)
        @todo2 = Factory.create(:todo_item, :user => @user)
        @todo3 = Factory.create(:todo_item, :user => @user)
      end

      describe "#index" do
        it "should populate @todo_items" do
          get :index
          response.should be_success
          assigns(:todo_items).should == [@todo1, @todo2, @todo3]
        end
  
        it "should respect sort column and direction" do
          mock_search_scope = double('search_scope')
          TodoItem.stub(:search) { mock_search_scope }
  
          mock_search_scope.should_receive(:order).with("description desc").and_return([])
  
          get :index, :sort => 'description', :direction => 'desc'
        end
        
        it "should respect pagination" do
          mock_search_scope = double('search_scope')
          mock_order_scope  = double('order_scope')
          TodoItem.stub(:search) { mock_search_scope }
          mock_search_scope.stub(:order) { mock_order_scope }
  
          mock_order_scope.should_receive(:paginate).with(:per_page => 20, :page => "34")
  
          get :index, :page => "34"
        end
  
        it "should handle search" do
          mock_search_scope = double('search_scope')
          mock_search_scope.stub(:order) { [] }
  
          TodoItem.should_receive(:search).with("fake_search").and_return(mock_search_scope)
  
          get :index, :search => 'fake_search'
        end
      end
  
      describe "#new" do
        it "should render the new template" do
          get :new
          response.should render_template('todo_items/new')
        end
      end
  
      describe "#create" do
        context "with invalid params" do
          before do
            @todo_item_params = { :position => 'foo' }
          end
  
          it "should not create a new todo_item" do
            lambda {
              post :create, :todo_item => @todo_item_params
            }.should_not change(TodoItem, :count)
          end
  
          it "should rerender the new page, and return errors" do
            post :create, :todo_item => @todo_item_params
            response.should render_template('todo_items/new')
            flash[:alert].should_not be_blank
            assigns(:todo).errors.size.should > 0
          end
        end
  
        context "with valid params" do
          before do
            @todo_item_params = { :position => 1, :description => 'new description' }
          end
  
          it "should create a new todo_item" do
            lambda {
              post :create, :todo_item => @todo_item_params
            }.should change(TodoItem, :count).by(1)
          end
        end
      end
  
      # describe "#show" do
      #   it "should retrieve the todo_item and render the show page got the supplied todo_item id" do
      #     get :show, :id => @todo1.to_param
      #     response.should render_template('todo_items/show')
      #     assigns(:todo).should == @todo1
      #   end
      # end
  
      describe "#edit" do
        it "should retrieve the todo_item and render the show page got the supplied todo_item id" do
          get :edit, :id => @todo1.to_param
          response.should render_template('todo_items/edit')
          assigns(:todo).should == @todo1
        end
      end
  
      describe "#update" do
        context "with invalid params" do
          before do
            @todo_item_params = { :description => "" }
          end
  
          it "should not create a new todo_item" do
            lambda {
              put :update, :id => @todo1.to_param, :todo_item => @todo_item_params
            }.should_not change(TodoItem, :count)
          end
  
          it "should rerender the edut page, and return errors" do
            put :update, :id => @todo1.to_param, :todo_item => @todo_item_params
            response.should render_template('todo_items/edit')
            flash[:alert].should_not be_blank
            assigns(:todo).errors[:description].should_not be_empty
          end
        end
  
        context "with valid params" do
          before do
            @todo_item_params = { :description => "changed_description" }
          end
  
          it "should update the todo_item" do
            put :update, :id => @todo1.to_param, :todo_item => @todo_item_params
            @todo1.reload.description.should == "changed_description"
          end
        end
      end
  
      describe "#destroy" do
        it "should delete the correct todo_item and return to the index page" do
          lambda {
            delete :destroy, :id => @todo1.to_param
          }.should change(TodoItem, :count).by(-1)
          lambda {
            @todo1.reload
          }.should raise_error(ActiveRecord::RecordNotFound)
          response.should redirect_to(todo_items_path)
        end
      end

      describe "#move_higher" do
        it "should move an item higher in the list" do
          TodoItem.order('position').all.should == [@todo1, @todo2, @todo3]
          post :move_higher, :id => @todo2.to_param
          TodoItem.order('position').all.should == [@todo2, @todo1, @todo3]
        end
      end

      describe "#move_lower" do
        it "should move an item higher in the list" do
          TodoItem.order('position').all.should == [@todo1, @todo2, @todo3]
          post :move_lower, :id => @todo2.to_param
          TodoItem.order('position').all.should == [@todo1, @todo3, @todo2]
        end
      end
    end

    context "rendering views" do
      render_views

      it "gets saved as a fixture so it can be used in Jasmine tests" do
        get :index
        response.should be_success
        save_fixture(html_for('body'), 'todo_items_controller_index')
      end
    end
  end
end
