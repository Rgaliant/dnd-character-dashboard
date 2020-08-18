class CreateCreateJoinTableCharactersCharClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_char_classes do |t|
      t.references :character, null: false, foreign_key: true
      t.references :char_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
