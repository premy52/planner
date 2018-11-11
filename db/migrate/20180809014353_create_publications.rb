class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :pub_name
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
