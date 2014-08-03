class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.integer :user_id
      t.integer :blog_id
      t.integer :rank
      t.decimal :value

      t.timestamps
    end
  end
end
