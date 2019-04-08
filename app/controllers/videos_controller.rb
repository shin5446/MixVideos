class VideosController < ApplicationController
  before_action :set_video, only: %i[show edit update destroy]
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

  def show; end

  def edit; end

  def update

    if @video.update(video_params)
      redirect_to videos_path, notice: "動画を編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path, notice:"投稿を削除しました！"
  end

  private

  def video_params
    params.require(:video).permit %i[title content image image_cache]
  end

  def set_video
    @video = Video.find(params[:id])
  end
end
