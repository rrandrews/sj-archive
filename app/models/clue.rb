class Clue < ApplicationRecord
  belongs_to :column, optional: true
  belongs_to :category
  #accepts_nested_attributes_for :category

end
