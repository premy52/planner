class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.integer :year
      t.integer :month
      t.string :caption
      t.references :super_topic, foreign_key: true

      t.timestamps
    end
  end
end
