class CreateCharactersFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :characters_features do |t|
      t.references :character, null: false, foreign_key: true
      t.references :feature, null: false, foreign_key: true

      t.timestamps
    end
  end
end
