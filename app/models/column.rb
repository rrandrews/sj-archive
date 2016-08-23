class Column < ApplicationRecord
  belongs_to :board, optional: true
  has_many :clues
  has_one :category
  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :clues,
    :reject_if => proc {|attributes|
      attributes.all? {|k,v| v.blank?}
    }
end
