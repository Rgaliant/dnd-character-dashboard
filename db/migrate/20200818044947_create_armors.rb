class CreateArmors < ActiveRecord::Migration[6.0]
  def change
    create_table :armors do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.string :equipment_category
      t.string :armor_category
      t.string :armor_class
      t.string :str_minimum
      t.boolean :stealth_disadvantage
      t.string :cost
      t.integer :weight
      t.string :url

      t.timestamps
    end
  end
end
