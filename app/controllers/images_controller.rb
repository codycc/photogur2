class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
  end

  def new
     @image = Image.new
  end


  def create
    # make a new picture with what picture_params returns (which is a method we're calling)
    @image = Image.new(images_params)
    if @image.save
      # if the save for the picture was successful, go to index.html.erb
      redirect_to images_url
    else
      # otherwise render the view associated with the action :new (i.e. new.html.erb)
      render :new
    end
  end

  private
  def images_params
    params.require(:image).permit(:artist, :title, :url)
  end
end
