class EpisodesController < ApplicationController

  before_action :require_perimission, only: [:edit, :destroy, :update]

  def index
    if user_signed_in?
      @episodes = Episode.where("owner_id = #{current_user.id} OR " +
                                "is_public = true").order(:air_date)
    else
      @episodes = Episode.where(is_public: true).order(:air_date)
    end
  end

  def new
    @contestants = Contestant.order(:last_name)
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
    @episode.owner = current_user
    set_clue_categories

    if @episode.save
      flash[:success] = "Episode successfully created."
      redirect_to @episode
    else
      @contestants = Contestant.order(:last_name)
      render 'new'
    end
  end

  def edit
   @episode = Episode.find(params[:id])
   @contestants = Contestant.order(:last_name)
   (3 - @episode.appearances.length).times do
     @episode.appearances.build
   end

  end

  def update
    @episode = Episode.find(params[:id])
    @episode.owner = current_user
    set_clue_categories
    if @episode.update(episode_params)
      flash[:success] = "Episode updated successfully."
      redirect_to @episode
    else
      @contestants = Contestant.order(:last_name)
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
    if Episode.find(params[:id]).destroy
      flash[:success] = "Episode destroyed successfully."
      redirect_to episodes_url
    else
      flash[:danger] = "Unable to destroy episode."
    end
  end

  private
    def episode_params
      params.require(:episode).permit(:title, :season, :episode, :air_date,
        :is_public,
        appearances_attributes: [:id, :contestant_id, :position],
        boards_attributes: [:id, :round,
          columns_attributes: [:id, :position,
            category_attributes: [:id, :name],
            clues_attributes: [:id, :position, :clue, :correct_response,
                               :pick_order, :dd_wager, :image_url, :note,
                               :answered_by,
              responses_attributes: [:id, :response, :is_correct,
                                     :contestant_id, :_destroy]
            ]
          ]
        ],
        final_attributes: [:id, :is_fj, :clue, :correct_response, :image_url,
          :note,
          responses_attributes: [:id, :contestant_id, :response, :position,
                                 :is_correct, :wager],
          category_attributes:[:id, :name]
        ]
      )
    end

    def require_perimission
      unless view_context.owner_or_admin(Episode.find(params[:id]).owner)
        redirect_to root_path
      end
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
