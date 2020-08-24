class Trait < ApplicationRecord
  # belongs_to :race
  # belongs_to :subrace

  has_many :characters_traits
end
