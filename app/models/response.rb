class Response < ApplicationRecord
  belongs_to :contestant
  belongs_to :clue

  attr_accessor :position

  def response
    if (self[:response].nil? || self[:response].empty?) && is_correct
      response.clue.correct_response
    else
      self[:response]
    end
  end

end
