class Episode < ApplicationRecord
  has_many :boards, -> {order(:round)}, dependent: :destroy
  has_many :appearances, dependent: :destroy
  has_many :contestants, through: :appearances
  belongs_to :final, class_name: 'Clue', foreign_key: 'final_id',
             dependent: :destroy
  accepts_nested_attributes_for :contestants
  accepts_nested_attributes_for :appearances
  accepts_nested_attributes_for :boards
  accepts_nested_attributes_for :final

  validates :title, presence: true


end
