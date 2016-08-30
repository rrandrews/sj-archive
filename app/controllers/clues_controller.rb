class CluesController < ApplicationController
  def new
    @clue = Clue.new
  end

  def index
    if params[:keywords].present?
      keywords = "%" + params[:keywords].downcase + "%"
      @clues = Clue.joins(:category).where("lower(correct_response) LIKE ? OR " +
                                           "lower(clue) LIKE ? OR " +
                                           "lower(name) LIKE ?",
                                           keywords, keywords, keywords)
    else
      @clues = []
    end

    respond_to do |format|
      format.html {}
      format.json { render json: @clues }
    end

  end

  def create

    @clue = Clue.new(clue_params)

    if @clue.save
      redirect_to @clue
    else
      render 'new'
    end
  end

  def show
    @clue = Clue.find(params[:id])
  end

  private
    def clue_params
      params.require(:clue).permit(:clue, :correct_response, :position, :cat)
    end

end
