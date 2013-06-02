class AdminAuthorsBooks < ActiveRecord::Migration
  def change
    create_table :admin_authors_books,:id=>false do |t|
      t.integer :admin_author_id, :null=>false
      t.integer :book_id, :null=>false
    end
  end
end
