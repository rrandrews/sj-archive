class Episode < ApplicationRecord
  has_many :boards, -> {order(:round)}, dependent: :destroy
  has_many :appearances, -> {order(:position)}, dependent: :destroy
  has_many :contestants, through: :appearances
  belongs_to :final, class_name: 'Clue', foreign_key: 'final_id',
             dependent: :destroy
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  accepts_nested_attributes_for :contestants
  accepts_nested_attributes_for :appearances
  accepts_nested_attributes_for :boards
  accepts_nested_attributes_for :final

  validates :title, presence: true

  def contestant(position)
    contestant = appearances.find_by(position: position)
  end

end
