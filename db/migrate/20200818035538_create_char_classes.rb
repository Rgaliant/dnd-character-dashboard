class CreateCharClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :char_classes do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.string :hit_die
      t.string :proficiency_choices
      t.references :proficiency, null: false, foreign_key: true
      t.text :saving_throws
      t.text :starting_equipment
      t.text :class_levels
      t.text :spellcasting
      t.string :url

      t.timestamps
    end
  end
end
