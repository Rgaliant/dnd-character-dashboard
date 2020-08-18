class CharactersAbilityScore < ApplicationRecord
  belongs_to :character
  belongs_to :ability_score
end
