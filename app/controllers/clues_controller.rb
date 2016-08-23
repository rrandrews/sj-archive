class CluesController < ApplicationController
  def new
    @clue = Clue.new
    #@clue.build_category
    @category = Category.new
    #@categories = Category.all
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
