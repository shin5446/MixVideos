class LikesController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]

  def create
    @like = current_user.likes.create(video_id: params[:video_id])
    @like.reload
    @video = Video.find(params[:video_id])
    render 'create.js.erb'
  end

  def destroy
    @like = current_user.likes.find_by(video_id: params[:video_id]).destroy
    @video = Video.find(params[:video_id])
    render 'destroy.js.erb'
  end
end
