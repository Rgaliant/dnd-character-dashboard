class CreateJoinTableCharactersLanguages < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :languages do |t|
      # t.index [:character_id, :language_id]
      # t.index [:language_id, :character_id]
    end
  end
end
