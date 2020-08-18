class CreateCharClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :char_classes do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.string :hit_die
      t.string :proficiency_choices
      t.references :proficiency, null: false, foreign_key: true
      t.text :saving_throws, array: true, default: []
      t.text :starting_equipment, array: true, default: []
      t.text :class_levels, array: true, default: []
      t.text :spellcasting, array: true, default: []
      t.string :url

      t.timestamps
    end
  end
end
