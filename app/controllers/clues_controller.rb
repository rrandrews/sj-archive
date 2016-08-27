class CluesController < ApplicationController
  def new
    @clue = Clue.new
  end

  def index
    if params[:keywords].present?
      keywords = "%" + params[:keywords].downcase + "%"
      @clues = Clue.where("lower(response) LIKE ? OR " +
                          "lower(clue) LIKE ?",
                          keywords, keywords)
    else
      @clues = []
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

  private
    def clue_params
      params.require(:clue).permit(:clue, :response, :position, :cat)
    end

end
