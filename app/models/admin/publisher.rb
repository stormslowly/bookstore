class Admin::Publisher < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_length_of :name, :in => 2..255
end
