class ChangeTypeToLangTypeOnLanguages < ActiveRecord::Migration[6.0]
  def change
    rename_column :languages, :type, :lang_type
  end
end
