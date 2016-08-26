class Column < ApplicationRecord
  belongs_to :board, optional: true
  belongs_to :category, optional: true, autosave: true
  has_many :clues
  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :clues

  def autosave_associated_records_for_category
    if new_category = Category.find_by_name(category.name)
      self.category = new_category
    else
      self.category.save!
      self.save!
    end
  end
end
