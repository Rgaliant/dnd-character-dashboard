class CreateTraits < ActiveRecord::Migration[6.0]
  def change
    create_table :traits do |t|
      t.string :external_id
      t.string :external_index
      t.references :race, null: false, foreign_key: true
      t.text :subrace
      t.string :name
      t.text :desc, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
