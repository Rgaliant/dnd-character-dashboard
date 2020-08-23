class Race < ApplicationRecord
  # belongs_to :proficiency
  # belongs_to :language

  has_many :characters_races
end
