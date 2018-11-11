class RemoveYearAndMonthFromSuperTopic < ActiveRecord::Migration[5.0]
  def change
  	remove_column :super_topics, :year
  	remove_column :super_topics, :month
  end
end
