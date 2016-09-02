class EpisodesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :new]

  def index
    @episodes = Episode.order(:air_date)
  end

  def new
    @contestants = Contestant.all
    @episode = Episode.new
    3.times do
      @episode.appearances.build
    end
    @episode.build_final
    3.times do
      @episode.final.responses.build
    end
    @episode.final.build_category
    @episode.boards.build
    @episode.boards.build
    @episode.boards.each do |board|
      6.times do
        new_column = board.columns.build
        new_column.build_category
        4.times do
          new_clue = new_column.clues.build
        end
      end
    end
  end

  def create
    @episode = Episode.new(episode_params)
    set_clue_categories

    if @episode.save
      redirect_to @episode
    else
      render 'new'
    end
  end

  def edit
   @episode = Episode.find(params[:id])
   @contestants = Contestant.all
   (3 - @episode.appearances.length).times do
     logger.debug("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX")
     @episode.appearances.build
   end

  end

  def update
    @episode = Episode.find(params[:id])
    set_clue_categories
    if @episode.update(episode_params)
      redirect_to @episode
    else
      render 'edit'
    end
  end

  def show
    @episode = Episode.find(params[:id])

    respond_to do |format|
      format.html {}
      format.json { render json: @episode }
    end
  end

  def destroy
    Episode.find(params[:id]).destroy
    redirect_to episodes_url
  end

  private
    def episode_params
      params.require(:episode).permit(:title, :season, :episode, :air_date,
        appearances_attributes: [:id, :contestant_id, :position],
        boards_attributes: [:id, :round,
          columns_attributes: [:id, :position,
            category_attributes: [:id, :name],
            clues_attributes: [:id, :position, :clue, :correct_response,
                               :pick_order, :dd_wager, :image_url, :note,
                               :answered_by,
              responses_attributes: [:id, :response, :is_correct, :contestant_id]
            ]
          ]
        ],
        final_attributes: [:id, :is_fj, :clue, :correct_response, :image_url,
          :note,
          responses_attributes: [:id, :response, :position, :is_correct, :wager],
          category_attributes:[:id, :name]
        ]
      )
    end

    def set_clue_categories
      @episode.boards.each do |board|
        board.columns.each do |column|
          column.clues.each do |clue|
            clue.category = column.category
          end
        end
      end
    end

end
