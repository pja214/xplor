class CreateBlogDislikeMaps < ActiveRecord::Migration
  def change
    create_table :blog_dislike_maps do |t|
      t.integer :user_id
      t.integer :blog_id

      t.timestamps
    end
  end
end