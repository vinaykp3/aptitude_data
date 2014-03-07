class TopicsController < ApplicationController

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

  def index
    @topics = Topic.all
  end

    private
    def topic_params
      params.require(:topic).permit(:topic_name)
    end

end