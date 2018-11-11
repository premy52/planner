class RemoveYearAndMonthFromTopic < ActiveRecord::Migration[5.0]
  def change
  	remove_column :topics, :year
  	remove_column :topics, :month

  end
end
