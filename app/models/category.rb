class Category < ApplicationRecord
  validates :name, presence: true

  def create

  end
  def create_or_find_category(params)

  end

  def to_s
    name
  end
end
