class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :new]

  def index
    @games = Game.order(:air_date)
  end

  def new
    @game = Game.new
    @game.build_final
    @game.final.build_category
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

  def edit
   @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    if @game.update(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def destroy
    Game.find(params[:id]).destroy
    redirect_to games_url
  end

  private
    def game_params
      params.require(:game).permit(:title, :season, :episode, :air_date,
        boards_attributes: [:id, :round,
          columns_attributes: [:id, :position,
            category_attributes: [:id, :name],
            clues_attributes: [:id, :position, :clue, :response,
                               :is_dd, :image_url]
          ]
        ],
        final_attributes: [:id, :is_fj, :clue, :response, :image_url,
          category_attributes:[:id, :name]
        ]
      )
    end
end
