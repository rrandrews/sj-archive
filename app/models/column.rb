class Column < ApplicationRecord
  belongs_to :board, optional: true
  has_many :clues, autosave: true
  belongs_to :category, optional: true, autosave: true
  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :clues

  def autosave_associated_records_for_category
    if new_category = Category.find_by_name(category.name)
      logger.debug "FOUND THE CATEGORY NAME"
      self.category = new_category
    else
      logger.debug "CREATING NEW CATEGORY"
      self.category.save!
    end
  end

end
