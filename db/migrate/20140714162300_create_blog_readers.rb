class CreateBlogReaders < ActiveRecord::Migration
  def change
    create_table :blog_readers do |t|
      t.integer :user_id
      t.integer :blog_id
      t.boolean :profiled
      t.boolean :liked
      t.boolean :disliked
      t.datetime :last_recommended

      t.timestamps
    end
  end
end
