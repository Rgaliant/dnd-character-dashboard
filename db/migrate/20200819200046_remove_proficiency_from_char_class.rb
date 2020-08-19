class RemoveProficiencyFromCharClass < ActiveRecord::Migration[6.0]
  def change
    remove_reference :char_classes, :proficiency, index: true, foreign_key: true
  end
end
