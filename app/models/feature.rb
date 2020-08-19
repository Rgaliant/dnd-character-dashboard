class Feature < ApplicationRecord
  belongs_to :class

  has_many :characters_features
end
