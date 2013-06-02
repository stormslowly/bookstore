class Book < ActiveRecord::Base
  has_and_belongs_to_many :admin_authors, :class_name => 'Admin::Author'
  belongs_to :admin_publisher, :class_name => 'Admin::Publisher'

  validates_presence_of :admin_authors
  validates_presence_of :admin_publisher
  validates_presence_of :title, :in=>1..255
  validates_numericality_of :page_counter,:only_integer => true
  validates_numericality_of :price
  validates_format_of :isbn, :with=> /[0-9\-Xx]{13}/
  validates_uniqueness_of :isbn

end
