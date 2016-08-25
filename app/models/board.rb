class Board < ApplicationRecord
  belongs_to :game, optional: true
  has_many :columns
  accepts_nested_attributes_for :columns
end
