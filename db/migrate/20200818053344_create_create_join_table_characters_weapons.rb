class CreateCreateJoinTableCharactersWeapons < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_weapons do |t|
      t.references :character, null: false, foreign_key: true
      t.references :weapon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
