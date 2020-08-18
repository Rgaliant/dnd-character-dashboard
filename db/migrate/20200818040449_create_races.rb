class CreateRaces < ActiveRecord::Migration[6.0]
  def change
    create_table :races do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.integer :speed
      t.text :ability_bonuses
      t.text :alignment
      t.string :age
      t.string :size
      t.string :size_description
      t.references :proficiency, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.text :language_desc
      t.references :traits, null: false, foreign_key: true
      t.references :subraces, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
