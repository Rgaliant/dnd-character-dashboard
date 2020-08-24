class CreateGears < ActiveRecord::Migration[6.0]
  def change
    create_table :gears do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.text :equipment_category
      t.string :gear_category
      t.string :cost
      t.string :weight
      t.string :url

      t.timestamps
    end
  end
end
