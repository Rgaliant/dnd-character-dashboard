class Subrace < ApplicationRecord
  belongs_to :race
  belongs_to :proficency
  belongs_to :language
  belongs_to :trait
end
