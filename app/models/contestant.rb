class Contestant < ApplicationRecord
  has_many :appearances

  def name
    first_name + " " + last_name
  end
end
