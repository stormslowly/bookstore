require 'test_helper'

class Admin::BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { :title =>'test book',
                            :publisher_id => 2 ,
                            :author_ids=>[ 1 ],
                            :published_at => Time.now,
                            :isbn=> '777-000-999-1',
                            :blurb=> 'this is a blurb',
                            :page_counter => 77,
                            :price => 66
                          }

    end

    assert_redirected_to book_path(assigns(:book))
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @book
    assert_response :success
  end

  test "should update book" do
    patch :update, id:  @book.id, book:{ :title =>'test book',
                                         :publisher_id => 1 ,
                                         :author_ids =>[ 1,2],
                                         :published_at => Time.now,
                                         :blurb=> 'this is a blurb',
                                         :page_counter => 77,
                                         :price => 66
                                        }

    assert_redirected_to book_path(assigns(:book))

    @book.reload

    assert_equal 1 ,@book.publisher.id
    assert_equal 2, @book.authors.size

  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_redirected_to books_path
  end
end
