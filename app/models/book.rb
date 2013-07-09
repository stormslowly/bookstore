class Book < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :categories

  has_attached_file :cover_image,
                    :styles => {:medium => '300x300>',
                                :thumb => '100x100>'},
                    :default_url => 'system/books/cover_images/:style/missing.jpg'


  has_and_belongs_to_many :authors, :class_name => 'Author'
  belongs_to :publisher, :class_name => 'Publisher'

  validates_presence_of :authors
  validates_presence_of :publisher
  validates_length_of :title, :in => 1..255
  validates_numericality_of :page_counter, :only_integer => true
  validates_numericality_of :price
  validates_format_of :isbn, :with => /[0-9\-Xx]{13}/
  validates_uniqueness_of :isbn

end
