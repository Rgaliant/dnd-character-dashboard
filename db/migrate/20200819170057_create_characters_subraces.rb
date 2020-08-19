class CreateCharactersSubraces < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_subraces do |t|
      t.references :character, null: false, foreign_key: true
      t.references :subrace, null: false, foreign_key: true

      t.timestamps
    end
  end
end
