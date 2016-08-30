class Appearance < ApplicationRecord
  belongs_to :episode
  belongs_to :contestant
end
