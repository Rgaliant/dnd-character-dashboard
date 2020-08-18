class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.text :desc, array: true, default: []
      t.text :ability_score, array: true, default: []
      t.string :url

      t.timestamps
    end
  end
end
