class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @type = params[:type]
    @post_videos = @user.videos

    if @type == 'like'
      @like_videos = @user.like_videos
    elsif @type == 'following'
      @following = @user.following
    elsif @type == 'followers'
      @followers = @user.followers
    end
  end
end
