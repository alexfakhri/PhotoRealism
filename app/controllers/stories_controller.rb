class StoriesController < ApplicationController

  def index
    @stories = Story.all
    @map_stories = Story.all
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

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    @story.update(story_params)

    redirect_to '/stories'
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    flash[:notice] = "Story has been deleted successfully"

    redirect_to '/stories'
  end

  def story_params
  	params.require(:story).permit(:title, :article, :image, :location)
  end

end
