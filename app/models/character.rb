class Character < ApplicationRecord
  has_many :ability_scores
  has_many :skills
  has_many :proficiencies
  has_many :languages
  has_many :char_classes
  has_many :sub_char_classes
  has_many :races
  has_many :weapons
  has_many :armors
  has_many :spells
  has_many :traits
end
