class RemoveProfileFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :profile, :text
  end
end
