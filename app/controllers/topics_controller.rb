class TopicsController < ApplicationController

  def index
    @topics       = Topic.all
  end

  def edit
    @topic        = Topic.find(params[:id])
  end

  def update
    topic = Topic.find(params[:id])
    topic.update_attributes(params[:topic])
    if topic.user_id
      redirect_to user_path(topic.user_id)
    else
      redirect_to topics_path
    end
  end

  def new
    @topic        = Topic.new
    render :new
  end

  def create
    @topic         = Topic.new(params[:topic])
    @topic.user_id = session[:user_id]
    @topic.save
    redirect_to root_path
  end

  def show
    @topic        = Topic.find(params[:id])
    render :json => { :description => render_to_string(partial: '/topics/description', layout: false, locals: {topic: @topic}), :topic_id => @topic.id.to_s }
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to user_path
  end

end
