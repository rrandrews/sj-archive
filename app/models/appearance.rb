class Appearance < ApplicationRecord
  belongs_to :episode
  belongs_to :contestant

  def total
    responses = Response.joins(clue: {column: :board})
      .where("episode_id = #{episode.id} AND contestant_id = #{contestant.id}")
    total = 0
    final = episode.final.responses.find_by(contestant_id: contestant.id)
    unless final.is_correct.nil? || final.wager.nil?
      total += final.is_correct ? final.wager : -(final.wager)
    end

    responses.each do |response|
      if response.clue.dd_wager && response.clue.dd_wager > 0
        value = response.clue.dd_wager
      else
        value = response.clue.value
      end
      total += response.is_correct ? value : -(value)
    end

    total
  end

end
