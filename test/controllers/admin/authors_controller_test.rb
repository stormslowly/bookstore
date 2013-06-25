require 'test_helper'

class Admin::AuthorsControllerTest < ActionController::TestCase
  setup do
    @author = authors(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_authors)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create author' do
    assert_difference('Author.count') do
      post :create, author: { first_name: @author.first_name, last_name: @author.last_name }
    end

    assert_redirected_to author_path(assigns(:admin_author))
  end

  test 'should show admin_author' do
    get :show, id: @author
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @author
    assert_response :success
  end

  test 'should update author' do
    patch :update, id: @author, author: { first_name: @author.first_name, last_name: @author.last_name }
    assert_redirected_to author_path(assigns(:admin_author))
  end

  test 'should destroy admin_author' do
    assert_difference('Author.count', -1) do
      delete :destroy, id: @author
    end

    assert_redirected_to authors_path
  end

  test 'bad create request' do

    assert_no_difference('Author.count') do
      post :create , author: { first_name: "just_first_name"}
    end

    assert_response :success
    assert_tag :tag=>'div' , :attributes=>{:class=>'field_with_errors'}
  end
end
