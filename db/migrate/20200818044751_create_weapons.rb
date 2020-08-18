class CreateWeapons < ActiveRecord::Migration[6.0]
  def change
    create_table :weapons do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.string :equipment_category
      t.string :weapon_category
      t.string :weapon_range
      t.string :category_range
      t.string :cost
      t.string :damage
      t.string :range
      t.string :weight
      t.string :weapon_properties

      t.timestamps
    end
  end
end
