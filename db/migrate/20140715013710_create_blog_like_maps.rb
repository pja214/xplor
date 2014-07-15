class CreateBlogLikeMaps < ActiveRecord::Migration
  def change
    create_table :blog_like_maps do |t|
      t.integer :user_id
      t.integer :blog_id
      t.timestamps
    end
  end
end
