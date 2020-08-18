class CreateCreateJoinTableCharactersSubCharClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_sub_char_classes do |t|
      t.references :character, null: false, foreign_key: true
      t.references :sub_char_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
