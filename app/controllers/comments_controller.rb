class CommentsController < ApplicationController

  def index
    @topic        = Topic.find(params[:topic_id])
    @comments     = @topic.comments
    @comment      = @topic.comments.new
  end

  def create
    topic = Topic.find(params[:topic_id])
    topic.comments.new(params[:comment])
    topic.save
    redirect_to topic_comments_path(topic.id)
  end
end