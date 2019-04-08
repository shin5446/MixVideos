class VideosController < ApplicationController
  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    if Video.create(video_params)
      redirect_to videos_path flash[:success] = "登録しました"
    else
      render 'new'
    end
  end

  def show
    @video = Video.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def video_params
    params.require(:video).permit %i[title content image image_cache]
  end
end
