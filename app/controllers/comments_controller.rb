class CommentsController < ApplicationController

  def index
    @topic        = Topic.find(params[:topic_id])
    @comments     = @topic.comments
    @comment      = @topic.comments.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @comment = @topic.comments.new
    @comment.text = params[:comment][:text]
    @comment.save
    redirect_to topic_comments_path(@topic.id)
  end
end