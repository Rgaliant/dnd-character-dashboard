class RemoveRaceFromTrait < ActiveRecord::Migration[6.0]
  def change
    remove_reference :traits, :race, index: true, foreign_key: true
  end
end
