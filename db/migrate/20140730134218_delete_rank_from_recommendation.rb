class DeleteRankFromRecommendation < ActiveRecord::Migration
  def change
    remove_column :recommendations, :rank
  end
end
