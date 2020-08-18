class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :backstory
      t.integer :level
      t.integer :experience
      
      t.timestamps
    end
  end
end
