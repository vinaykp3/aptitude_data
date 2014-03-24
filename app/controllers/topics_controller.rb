class TopicsController < ApplicationController

load_and_authorize_resource

  def index
    @topics = Topic.search(params[:search])

  end

  def new
    @topic = Topic.new

  end

  def create
    @topic = Topic.new(topic_params)
      if @topic.save
        redirect_to topics_path
      else
        render 'new'
      end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])
      @topic.destroy
    redirect_to action: :index
  end

  def update
    @topic = Topic.find(params[:id])
      if @question.update(topic_params)
      else
        render 'edit'
      end
  end

  def fetch_topic
    @topic_id = Topic.fecth_topic params[:topic_id]
    render :partial => 'topics/fetch_topic'
  end

  private
  def topic_params
    params.require(:topic).permit(:topic_name,:description)
  end

end