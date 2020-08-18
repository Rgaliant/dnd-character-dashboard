class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.string :level
      t.references :char_class, null: false, foreign_key: true
      t.references :sub_char_class, null: false, foreign_key: true
      t.text :desc, array: true, default: []
      t.string :url

      t.timestamps
    end
  end
end
