class CreateAbilityScores < ActiveRecord::Migration[6.0]
  def change
    create_table :ability_scores do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.string :full_name
      t.text :desc, array: true, default: []
      t.text :skills, array: true, default: []
      t.string :external_url

      t.timestamps
    end
  end
end
