class Clue < ApplicationRecord
  belongs_to :column, optional: true
  belongs_to :category, optional: true

  #accepts_nested_attributes_for :category

end
