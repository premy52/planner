class CreateSuperTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :super_topics do |t|
      t.integer :year
      t.integer :month
      t.string :caption

      t.timestamps
    end
  end
end
