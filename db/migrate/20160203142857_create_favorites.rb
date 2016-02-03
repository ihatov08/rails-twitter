class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.integer :user_id
      t.references :user, index: true, foreign_key: true
      t.integer :tweet_id
      t.references :tweet, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :favorites, [ :user_id, :tweet_id ], unique: true
  end
end
