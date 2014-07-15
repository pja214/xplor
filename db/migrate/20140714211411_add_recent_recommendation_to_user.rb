class AddRecentRecommendationToUser < ActiveRecord::Migration
  def change
    add_column :users, :last_recommendation_time, :datetime
    add_column :users, :current_recommendation, :integer
  end
end
