class CommentsController < ApplicationController
  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.build(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        flash[:danger] = '投稿できませんでした'
        format.html { redirect_to video_path(@video) }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    render :index if @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :video_id, :content)
  end