class Game < ApplicationRecord
  has_many :boards, dependent: :destroy
  accepts_nested_attributes_for :boards


end
