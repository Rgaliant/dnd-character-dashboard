class CreateCreateJoinTableCharactersArmors < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_armors do |t|
      t.references :character, null: false, foreign_key: true
      t.references :armor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
