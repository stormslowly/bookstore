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
  test "should success when new with proper parameters" do
    book = Book.new(:title=>"great ruy",
                    :admin_publisher => Admin::Publisher.find(1),
                    :admin_authors => Admin::Author.all,
                    :published_at => Time.now ,
                    :isbn => 123-456-999,
                    :blurb => "good book for rubist",
                    :page_counter =>55,
                    :price =>5.5)

    assert book
    assert_not_nil book.save()
  end
end