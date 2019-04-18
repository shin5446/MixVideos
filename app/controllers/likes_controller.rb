class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  def show
    user = User.find(params[:id])
    type = params[:type]

    if type == 'post'
      @post_videos = user.videos
    elsif type == 'like'
      @like_videos = user.like_videos
    end
  end

  def create
    like = current_user.likes.create(video_id: params[:video_id]) unless current_user.nil?
    redirect_to videos_url flash[:success] = "#{like.video.user.name}さんの動画をいいねしました"
  end

  def destroy
    like = current_user.likes.find_by(id: params[:id]).destroy
    redirect_to videos_url flash[:danger] = "#{like.video.user.name}さんの動画をいいね解除しました"
  end
end
