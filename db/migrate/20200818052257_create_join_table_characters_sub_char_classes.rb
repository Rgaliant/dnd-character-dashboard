class CreateJoinTableCharactersSubCharClasses < ActiveRecord::Migration[6.0]
  def change
    create_join_table :characters, :sub_char_classes do |t|
      # t.index [:character_id, :sub_char_class_id]
      # t.index [:sub_char_class_id, :character_id]
    end
  end
end
