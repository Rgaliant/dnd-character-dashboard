class RemoveProficiencyFromRace < ActiveRecord::Migration[6.0]
  def change
    remove_reference :races, :proficiency, index: true, foreign_key: true
    remove_reference :races, :language, index: true, foreign_key: true
  end
end
