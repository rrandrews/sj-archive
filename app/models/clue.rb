class Clue < ApplicationRecord
  has_many :responses, dependent: :destroy
  belongs_to :column, optional: true
  belongs_to :category, optional: true, autosave: true
  accepts_nested_attributes_for :category
  accepts_nested_attributes_for :responses, allow_destroy: true

  attr_accessor :answered_by

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

  def as_json(options = { })
    super((options || {}).merge({
      :methods => [:category_name, :episode_title, :value, :episode_date]
      }))
  end

  def category_name
    category.name
  end

  def value
    if is_fj
      "Final"
    else
      value = position * 250 * column.board.round
      value = value.to_s + " DD" if is_dd
      value
    end
  end

  def episode
    is_fj ? Episode.find_by(final: self) : column.board.episode
  end

  def episode_title
    is_fj ? Episode.find_by(final: self).title : column.board.episode.title
  end

  def episode_date
    is_fj ? Episode.find_by(final: self).air_date : column.board.episode.air_date
  end

end
