require 'test_helper'

class TodosControllerTest < ActionController::TestCase


  setup do
    @todo = todos(:one)
    @user = users(:michael)
  end


  test "should redirect index when not logged in" do
    get :index, d: '2015-05-30'
    assert_redirected_to login_path
  end


  test "should redirect edit when not logged in" do
    get :edit, id: @todo
    assert_redirected_to login_path
  end


  test "should get today" do
    log_in_as(@user)
    get :today
    assert_response :success
    assert_not_nil assigns(:todos)
  end


  test "should get tomorrow" do
    log_in_as(@user)
    get :tomorrow
    assert_response :success
    assert_not_nil assigns(:todos)
  end


  #test "should get an item" do
  #  get :show, id: @todo
  #  assert_response :success
  #  assert_not_nil assigns(:todo)
  #end


  test "should get index" do
    log_in_as(@user)
    get :index, d: '2015-05-30'
    assert_response :success
    assert_not_nil assigns(:todos)
  end


  test "should goto today when index is called with no date" do
    log_in_as(@user)
    get :index
    assert_redirected_to today_path
  end


  test "should add an item" do
    log_in_as(@user)
    b = Date.today.strftime('%m/%d/%Y')
    assert_difference('Todo.count') do
      post :create, todo: {subject: 'test', due_date: b, recurrence: 1, is_complete: false }
    end
  end


  test "should delete an item" do
    log_in_as(@user)
    assert_difference('Todo.count', -1) do
      delete :destroy, id: @todo, format: :js
    end
  end


  test "should update an item" do
    log_in_as(@user)
    patch :update, id: @todo, todo: { subject: @todo.subject + ' e', due_date: Date.today.strftime('%m/%d/%Y') }
  end


  test "should mark an item complete" do
    log_in_as(@user)
    put :mark_complete, format: :js, id: @todo, todo: { is_complete: true }
    test = Todo.find(@todo.id)
    assert_equal true, test.is_complete?
  end


  test "should mark an item incomplete" do
    log_in_as(@user)
    put :mark_incomplete, format: :js, id: @todo, todo: { is_complete: false }
    test = Todo.find(@todo.id)
    assert_equal false, test.is_complete?
  end


  #test "should move this item to tomorrow" do
  #  put :move_to_tomorrow, id: @todo
  #  test = Todo.find(@todo.id)
  #  assert_equal Date.tomorrow, test.due_date
  #end


  test "should skip this item" do
    log_in_as(@user)
    put :skip, id: @todo
    test = Todo.find(@todo.id)
    assert_equal Date.tomorrow, test.due_date
  end


end
