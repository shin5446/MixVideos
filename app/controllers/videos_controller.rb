class VideosController < ApplicationController
  before_action :set_video, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[edit update destroy]
  before_action :correct_user, only: %i[edit destroy]
  def index
    @q = Video.ransack(params[:q])
    @videos = @q.result(distinct: true)
    @videos = if params[:sort_like]
                Video.sort_like
              elsif params[:sort_created_at]
                Video.sort_created_at
              else
                Video.all
              end
  end

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      redirect_to videos_path flash[:success] = '登録しました'
    else
      render 'new'
    end
  end

  def show
    @like = current_user.likes.find_by(video_id: @video.id) unless current_user.nil?
    @url = embed_url(@video)
    @comments = @video.comments
    @comment = @video.comments.build
  end

  def edit; end

  def update
    if @video.update(video_params)
      redirect_to videos_path flash[:success] = '動画を編集しました！'
    else
      render 'edit'
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path flash[:success] = '投稿を削除しました！'
  end

  private

  def video_params
    params.require(:video).permit(:title, :content, :url, :image, :image_cache, :user_id, :video_id, genre_ids: [])
  end

  def set_video
    @video = Video.find(params[:id])
  end

  def correct_user
    unless current_user.id == @video.user_id
      flash[:danger] = "他人の投稿は編集できません！"
      redirect_to videos_path
    end
  end
end
