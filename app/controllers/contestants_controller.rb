class ContestantsController < ApplicationController
  def index
    if params[:keywords].present?
      keywords = "%" + params[:keywords].downcase + "%"
      @contestants = Contestant.where("lower(first_name) LIKE ? OR " +
                                      "lower(last_name) LIKE ?",
                                      keywords, keywords)
    else
      @contestants = Contestant.order(:last_name)
    end

    respond_to do |format|
      format.html {}
      format.json { render json: @contestants }
    end
  end

  def show
    @contestant = Contestant.find(params[:id])
    @episodes = []
    Appearance.where("contestant_id = #{params[:id]}").each do |appearance|
      @episodes.push appearance.episode
    end

  end

  def create
    @contestant = Contestant.new(contestant_params)
    logger.debug params
    logger.debug params[:first_name]
    logger.debug params[:last_name]

    respond_to do |format|
      if @contestant.save
        format.html {}
        format.json { render json: @contestant }
      else
        format.html {}
        format.json { render json: @contestant.errors, status: "dunno"}
      end
    end
  end

  private
    def contestant_params
      params.require(:contestant).permit(:first_name, :last_name)
    end
end
