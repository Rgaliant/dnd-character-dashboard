class Spell < ApplicationRecord
  # belongs_to :class
  # belongs_to :subclass
  # belongs_to :magic_school

  has_many :characters_spells
end
