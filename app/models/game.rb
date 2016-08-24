class Game < ApplicationRecord
  has_many :boards, autosave: true
  has_one :clue, foreign_key: 'final'
  accepts_nested_attributes_for :boards
  accepts_nested_attributes_for :clue

  # def autosave_associated_records_for_boards
  #   self.boards.save!
  # end
end
