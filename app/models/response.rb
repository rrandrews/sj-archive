class Response < ApplicationRecord
  belongs_to :contestant
  belongs_to :clue

  attr_accessor :position


end
