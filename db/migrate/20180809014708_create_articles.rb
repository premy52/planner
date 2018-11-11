class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :caption
      t.integer :pub_year
      t.integer :pub_month
      t.references :publication, foreign_key: true
      t.references :topic, foreign_key: true
      t.references :super_topic, foreign_key: true
      t.string :link

      t.timestamps
    end
  end
end
