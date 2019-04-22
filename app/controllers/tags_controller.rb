class TagsController < ApplicationController
  def index
    @tags = Video.all_tags.order(taggings_count: :desc)
  end
end
