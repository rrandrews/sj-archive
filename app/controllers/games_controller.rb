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
        new_column = board.columns.build
        new_column.build_category
        4.times do
          new_column.clues.build
        end
      end
    end
  end

  def create
    @game = Game.new(game_params)

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
        boards_attributes: [:round,
          columns_attributes: [
            category_attributes: [:name],
            clues_attributes: [:position, :clue, :response]
          ]
        ],
        final_attributes: [:position, :clue, :response,
          category_attributes: [:name]
        ]
      )
    end
end
