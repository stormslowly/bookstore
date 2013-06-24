require 'test_helper'

class BookTest < ActionDispatch::IntegrationTest


  test "book administrator" do
    publisher = Admin::Publisher.create(:name => 'super_house')
    author = Admin::Author.create(:first_name => 'good', :last_name => 'teacher')

    bob = new_session_as(:bob)

    ruby_for_dummies = bob.add_book :book => {
        :title => 'Ruby for Dummies',
        :publisher_id => publisher.id,
        :author_ids => [author.id],
        :published_at => Time.now,
        :isbn => '123-123-123-X',
        :blurb => 'The best book released since "Eating for Dummies"',
        :page_counter => 224,
        :price => 40.4
    }

  end


  private

  module BookTestDSL
    attr_writer :name

    def add_book(parameters)
      post '/books',parameters

      assert_response :redirect
      follow_redirect!
      assert_response :success

      #assert_template %r{\Abook/show\Z}
      assert_tag :tag => 'div', :content => parameters[:book][:title]

      Book.find_by_title(parameters[:book][:title])
    end

  end


  def new_session_as(name)
    open_session do |session|

      session.extend BookTestDSL
      session.name = name

      yield session if block_given?

    end
  end

end



