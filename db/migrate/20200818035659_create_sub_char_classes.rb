class CreateSubCharClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :sub_char_classes do |t|
      t.string :external_id
      t.string :external_index
      t.references :char_class, null: false, foreign_key: true
      t.string :name
      t.string :sub_char_class_flavor
      t.text :desc

      t.timestamps
    end
  end
end
