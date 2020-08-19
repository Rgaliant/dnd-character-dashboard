class ChangeTypeToLangTypeOnProficiencies < ActiveRecord::Migration[6.0]
  def change
    rename_column :proficiencies, :type, :prof_type
  end
end
