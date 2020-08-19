class CharClass < ApplicationRecord
  # has_many :proficiencies, through: :class_proficiencies

  # has_many :class_proficiencies

  has_many :characters_char_class

end
