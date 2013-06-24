class Book < ActiveRecord::Base
  has_and_belongs_to_many :authors, :class_name => 'Author'
  belongs_to :publisher, :class_name => 'Publisher'

  validates_presence_of :authors
  validates_presence_of :publisher
  validates_presence_of :title, :in=>1..255
  validates_numericality_of :page_counter,:only_integer => true
  validates_numericality_of :price
  validates_format_of :isbn, :with=> /[0-9\-Xx]{13}/
  validates_uniqueness_of :isbn

end
