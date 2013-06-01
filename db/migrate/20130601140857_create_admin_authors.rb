class CreateAdminAuthors < ActiveRecord::Migration
  def change
    create_table :admin_authors do |t|
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
