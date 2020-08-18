class CreateCreateJoinTableCharactersLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_languages do |t|
      t.references :character, null: false, foreign_key: true
      t.references :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
