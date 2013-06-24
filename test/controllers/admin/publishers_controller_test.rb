require 'test_helper'

class Admin::PublishersControllerTest < ActionController::TestCase
  setup do
    @publisher = publishers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_publishers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin_publisher" do
    assert_difference('Publisher.count') do
      post :create, publisher: { name: "just a new  press" }
    end

    assert_redirected_to publisher_path(assigns(:publisher))
  end

  test "should show admin_publisher" do
    get :show, id: @publisher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @publisher
    assert_response :success
  end

  test "should update admin_publisher" do
    patch :update, id: @publisher, publisher: { name: @publisher.name }
    assert_redirected_to publisher_path(assigns(:publisher))
  end

  test "should destroy admin_publisher" do
    assert_difference('Admin::Publisher.count', -1) do
      delete :destroy, id: @publisher
    end

    assert_redirected_to publishers_path
  end
end
