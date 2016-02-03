class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.integer :reply_tweet_id
      t.text :content, null: false

      t.timestamps null: false
    end
  end
end
