class AddImageToBook < ActiveRecord::Migration

  def self.up
    add_attachment :books, :cover_image
  end

  def self.down
    remove_attachment :books,:cover_image
  end

end
