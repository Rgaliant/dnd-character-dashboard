class CreateProficiencies < ActiveRecord::Migration[6.0]
  def change
    create_table :proficiencies do |t|
      t.string :external_id
      t.string :external_index
      t.string :type
      t.string :name
      t.text :classes, array: true, default: []
      t.text :races, array: true, default: []
      t.string :url

      t.timestamps
    end
  end
end
