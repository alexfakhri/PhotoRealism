class StoriesController < ApplicationController



  def index
    @stories = Story.all
  end

  def new
  	@story = Story.new
  end

  def create
  	@story = Story.create(story_params)
  	redirect_to '/stories'
  end

  def show
  	@story = Story.find(params[:id])
  end

  def story_params
  	params.require(:story).permit(:title, :article, :image)
  end

end
