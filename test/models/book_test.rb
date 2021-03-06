require 'test_helper'

class BookTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should failed when new without parameters' do
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
  test 'should success when new with proper parameters' do
    book = Book.new(:title => 'great ruy',
                    :publisher => Publisher.find(1),
                    :authors => Author.all,
                    :published_at => Time.now,
                    :isbn => '123-456-999-9',
                    :blurb => 'good book for rubist',
                    :page_counter => 55,
                    :price => 5.5)

    assert book
    assert_not_nil book.save!
    assert_equal 3, book.id
    assert_equal [],book.category_list
  end

  test 'book belongs to publisher and publisher has many books' do
    apress = Publisher.find_by_name("Apress")
    assert_equal 2, apress.books.size

    new_book = Book.new(:title => 'super rubist handbook',
                        :publisher => apress,
                        :authors => [Author.find(2)],
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


  test 'books has many authors and belongs to them' do
    assert_equal 2,2

    book_has_two_authors = Book.new(:title=>'RoR E-commerce',
                    :publisher=> Publisher.find(2),
                    :authors => [ Author.find(2),
                                  Author.find(1)],
                    :published_at => Time.now,
                    :isbn => '201-201-211-x',
                    :blurb => 'you will love this book',
                    :page_counter => 445,
                    :price => 400)

    assert book_has_two_authors.save

    book_has_two_authors.reload

    assert_equal 2,book_has_two_authors.authors.size

    assert Author.find(1).books.find(book_has_two_authors.id)
    assert Author.find(2).books.find(book_has_two_authors.id)
  end


end