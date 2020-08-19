class CharClass < ApplicationRecord
  belongs_to :proficiency

  has_many :characters_char_class

end
