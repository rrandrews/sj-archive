class Board < ApplicationRecord
  belongs_to :game, optional: true
  has_many :columns, -> {order(:position)}, dependent: :destroy
  accepts_nested_attributes_for :columns
end
