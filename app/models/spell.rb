class Spell < ApplicationRecord
  belongs_to :class
  belongs_to :subclass
end
