class CommentsController < ApplicationController
  def create
    @video = Video.find(params[:video_id])
    @comment = @video.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
      else
        format.html { redirect_to video_path(@video), notice: '投稿できませんでした...' }
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:video_id, :content)
  end
end
