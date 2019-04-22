class TagsController < ApplicationController
  PER_PAGE = 200

  def index
    @tags = Video.all_tags.page(params[:page]).per(PER_PAGE).order(taggings_count: :desc)
  end
end
