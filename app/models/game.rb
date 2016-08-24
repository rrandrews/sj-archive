class Game < ApplicationRecord
  has_many :boards, autosave: true
  has_many :columns, through: :boards, autosave:true
  accepts_nested_attributes_for :boards

  # def autosave_associated_records_for_boards
  #   self.boards.save!
  # end
end
