class Board < ApplicationRecord
  belongs_to :game
  has_many :columns
  accepts_nested_attributes_for :columns
end
