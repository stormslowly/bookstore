class AuthorsBooks < ActiveRecord::Migration
  def change
    create_table :authors_books,:id=>false do |t|
      t.integer :author_id, :null=>false
      t.integer :book_id, :null=>false
    end
  end
end
