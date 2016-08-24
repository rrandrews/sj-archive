class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
    @game.boards.build
    @game.boards.build
    @game.boards.each do |board|
      6.times do
        logger.debug "DOIN IT"
        new_column = board.columns.build
        new_column.build_category
        4.times do
          new_column.clues.build
        end
      end
    end
    logger.debug "after new: " + @game.boards.count.to_s
  end

  def create
    @game = Game.new(game_params)
    logger.debug "BOARD COUNT: " + @game.boards.count.to_s
    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  private
    def game_params
      params.require(:game).permit(:title, :season, :episode, :air_date,
        boards_attributes: [:id, :round,
          columns_attributes: [:id, :position,
            category_attributes: [:id, :name],
            clues_attributes: [:id, :position, :clue, :response]
          ]
        ]
      )
    end
end
