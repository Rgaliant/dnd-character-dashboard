class CreateMagicSchools < ActiveRecord::Migration[6.0]
  def change
    create_table :magic_schools do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.string :desc
      t.string :url

      t.timestamps
    end
  end
end
