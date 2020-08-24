class RemoveSubCharClassAndCharClassFromSpell < ActiveRecord::Migration[6.0]
  def change
    remove_reference :spells, :char_class, index: true, foreign_key: true
    remove_reference :spells, :sub_char_class, index: true, foreign_key: true
  end
end
