class RelationshipsController < ApplicationController
  before_action :authenticate_user!, only: %i[create destroy]
  respond_to? :js

  def show
    user = User.find(params[:id])
    type = params[:type]

    if type == 'following'
      @following = user.following
    elsif type == 'followers'
      @followers = user.followers
    end
  end

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    @user
  end
end
