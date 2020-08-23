class RemoveProficiencyFromSubrace < ActiveRecord::Migration[6.0]
  def change
    remove_reference :subraces, :proficiency, index: true, foreign_key: true
    remove_reference :subraces, :language, index: true, foreign_key: true
    remove_reference :subraces, :trait, index: true, foreign_key: true
  end
end
