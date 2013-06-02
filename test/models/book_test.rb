require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should failed when new without parameters" do
    book = Book.new

    assert_equal false, book.save
    assert_equal 7 ,book.errors.size
    #book.errors.o( :title)
    assert  book.errors[:title]
    assert  book.errors[:admin_publisher]
    assert  book.errors[:admin_authors]
    assert  book.errors[:page_counter]
    assert  book.errors[:price]
    assert  book.errors[:isbn]
  end

end