class CreateBlogProfileMaps < ActiveRecord::Migration
  def change
    create_table :blog_profile_maps do |t|
      t.integer :user_id
      t.integer :blog_id
      t.timestamps
    end
  end
end
