class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :external_id
      t.string :external_index
      t.string :name
      t.string :type
      t.text :typical_speakers, array: true, default: []
      t.string :script
      t.string :url

      t.timestamps
    end
  end
end
