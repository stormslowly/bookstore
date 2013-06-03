require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should failed when new without parameters" do
    book = Book.new

    assert_equal false, book.save
    assert_equal 6, book.errors.size
    assert book.errors[:title]
    assert book.errors[:publisher]
    assert book.errors[:authors]
    assert book.errors[:page_counter]
    assert book.errors[:price]
    assert book.errors[:isbn]
  end
  test "should success when new with proper parameters" do
    book = Book.new(:title => 'great ruy',
                    :publisher => Admin::Publisher.find(1),
                    :authors => Admin::Author.all,
                    :published_at => Time.now,
                    :isbn => '123-456-999-9',
                    :blurb => 'good book for rubist',
                    :page_counter => 55,
                    :price => 5.5)

    assert book
    assert_not_nil book.save!
    assert_equal 3, book.id

  end

  test "book belongs to publisher and publisher has many books" do
    apress = Admin::Publisher.find_by_name("Apress")
    assert_equal 2, apress.books.size

    new_book = Book.new(:title => 'super rubist handbook',
                        :publisher => apress,
                        :authors => [Admin::Author.find(2)],
                        :published_at => Time.now,
                        :isbn => '200-200-210-9',
                        :blurb => 'the way to super rubist',
                        :page_counter => 99,
                        :price => 0.0)

    apress.books << new_book
    apress.reload
    new_book.reload


    assert_equal 3, apress.books.size
    assert_equal 'Apress', new_book.publisher.name

  end


end