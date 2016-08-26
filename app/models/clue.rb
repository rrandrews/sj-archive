class Clue < ApplicationRecord
  belongs_to :column, optional: true
  belongs_to :category, optional: true, autosave: true
  accepts_nested_attributes_for :category

  mount_uploader :attachment, ImageUploader

  def autosave_associated_records_for_category
    if self.category
      if new_category = Category.find_by_name(category.name)
        self.category = new_category
      else
        self.category.save!
        self.save!
      end
    end
  end
end
