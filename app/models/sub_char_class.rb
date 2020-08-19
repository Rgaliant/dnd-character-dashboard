class SubCharClass < ApplicationRecord
  has_many :char_classes

  has_many :characters_sub_char_class
end
