require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test 'author create' do

    author = Author.new(:first_name=>'stephen', :last_name=>'shu')

    assert_equal 'stephen' , author.first_name
    assert_equal 'shu' , author.last_name

  end


end
