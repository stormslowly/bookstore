require 'test_helper'

class Admin::PublishersControllerTest < ActionController::TestCase
  setup do
    @admin_publisher = admin_publishers(:one)
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
    assert_difference('Admin::Publisher.count') do
      post :create, admin_publisher: { name: "just a new  press" }
    end

    assert_redirected_to admin_publisher_path(assigns(:admin_publisher))
  end

  test "should show admin_publisher" do
    get :show, id: @admin_publisher
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin_publisher
    assert_response :success
  end

  test "should update admin_publisher" do
    patch :update, id: @admin_publisher, admin_publisher: { name: @admin_publisher.name }
    assert_redirected_to admin_publisher_path(assigns(:admin_publisher))
  end

  test "should destroy admin_publisher" do
    assert_difference('Admin::Publisher.count', -1) do
      delete :destroy, id: @admin_publisher
    end

    assert_redirected_to admin_publishers_path
  end
end
