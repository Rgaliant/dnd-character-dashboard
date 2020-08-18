class CreateJoinTableCharactersCharClasses < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :char_classes do |t|
      # t.index [:character_id, :char_class_id]
      # t.index [:char_class_id, :character_id]
    end
  end
end
