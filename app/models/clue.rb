class Clue < ApplicationRecord
  belongs_to :column, optional: true
  belongs_to :category
  #accepts_nested_attributes_for :category

  def cat
    category
  end
  def cat=(cat)
    new_or_found_category = Category.find_or_create_by(name: cat)
    self.category = new_or_found_category
  end
end
