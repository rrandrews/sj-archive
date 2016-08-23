class Clue < ApplicationRecord
  belongs_to :column
  belongs_to :category
end
