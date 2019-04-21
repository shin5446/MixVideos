class TagsController < ApplicationController
  def index
    @tags = Video.all_tags
  end
end
