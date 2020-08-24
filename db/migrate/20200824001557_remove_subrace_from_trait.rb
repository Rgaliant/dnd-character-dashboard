class RemoveSubraceFromTrait < ActiveRecord::Migration[6.0]
  def change
    remove_column :traits, :subrace
  end
end
