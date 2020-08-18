class CreateCreateJoinTableCharactersTraits < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_traits do |t|
      t.references :character, null: false, foreign_key: true
      t.references :trait, null: false, foreign_key: true

      t.timestamps
    end
  end
end
