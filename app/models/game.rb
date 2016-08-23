class Game < ApplicationRecord
  has_many :boards
  accepts_nested_attributes_for :board
end
