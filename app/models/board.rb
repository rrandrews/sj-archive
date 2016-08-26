class Board < ApplicationRecord
  belongs_to :game, optional: true
  has_many :columns, dependent: :destroy
  accepts_nested_attributes_for :columns
end
