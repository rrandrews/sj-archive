class Clue < ApplicationRecord
  belongs_to :column, optional: true
  belongs_to :category, optional: true#, autosave: true
  accepts_nested_attributes_for :category
  # 
  # def autosave_associated_records_for_category
  #   if new_category = Category.find_by_name(category.name)
  #     self.category = new_category
  #   else
  #     self.category.save!
  #   end
  # end

end
