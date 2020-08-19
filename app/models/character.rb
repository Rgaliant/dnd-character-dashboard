class Character < ApplicationRecord
  ## define the join tables relations
  has_many :characters_traits
  has_many :characters_ability_scores
  has_many :characters_proficiencies
  has_many :characters_languages
  has_many :characters_char_classes
  has_many :characters_sub_char_classes
  has_many :characters_races
  has_many :characters_weapons
  has_many :characters_armors
  has_many :characters_spells
  has_many :characters_traits
  has_many :characters_features
  has_many :characters_subraces
  has_many :characters_skills

  ## define the through relations
  has_many :ability_scores, through: :characters_ability_scores
  has_many :skills, through: :characters_skills
  has_many :proficiencies, through: :characters_proficiencies
  has_many :languages, through: :characters_languages
  has_many :char_classes, through: :chararacters_char_classes
  has_many :sub_char_classes, through: :characters_sub_char_classes
  has_many :races, through: :characters_races
  has_many :subraces, through: :characters_subraces
  has_many :weapons, through: :characters_weapons
  has_many :armors, through: :characters_armors
  has_many :spells, through: :characters_spells
  has_many :traits, through: :characters_traits
  has_many :features, through: :characters_features
  
  
end
