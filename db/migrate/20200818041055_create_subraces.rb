class CreateSubraces < ActiveRecord::Migration[6.0]
  def change
    create_table :subraces do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.references :race, null: false, foreign_key: true
      t.string :desc
      t.text :ability_bonus
      t.references :proficiency, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true
      t.references :trait, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
