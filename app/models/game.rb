class Game < ApplicationRecord
  has_many :boards, dependent: :destroy
  belongs_to :final, class_name: 'Clue', foreign_key: 'final_id'
  accepts_nested_attributes_for :boards
  accepts_nested_attributes_for :final

  validates :title, presence: true
end
