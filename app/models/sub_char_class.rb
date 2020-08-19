class SubCharClass < ApplicationRecord
  belongs_to :class

  has_many :characters_sub_char_class
end
