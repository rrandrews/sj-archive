class Board < ApplicationRecord
  belongs_to :game, optional: true
  has_many :columns, autosave: true
  accepts_nested_attributes_for :columns
end
