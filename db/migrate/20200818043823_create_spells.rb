class CreateSpells < ActiveRecord::Migration[6.0]
  def change
    create_table :spells do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.text :desc
      t.text :higher_level
      t.string :range
      t.text :components
      t.string :material
      t.boolean :ritual
      t.string :duration
      t.boolean :concentration
      t.string :casting_time
      t.integer :level
      t.string :school
      t.references :char_class, null: false, foreign_key: true
      t.references :sub_char_class, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
