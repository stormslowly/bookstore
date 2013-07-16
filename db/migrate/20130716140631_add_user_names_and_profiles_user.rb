class AddUserNamesAndProfilesUser < ActiveRecord::Migration

  def self.up
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :profile, :text
  end

  def self.down
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :profile
  end


end
