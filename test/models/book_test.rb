require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should failed when new without parameters" do
    book = Book.new
    assert_equal false, book.save
    assert_equal 7,book.errors.size
  end

end