class TopicsController < ApplicationController
  before_action :set_super_topic, except: :index
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  # GET /topics
  # GET /topics.json
  def index
    @topics = Topic.all.order(:caption)
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
  end

  # GET /topics/new
  def new
    @topic = @super_topic.topics.new
  end

  # GET /topics/1/edit
  def edit
  end

  # POST /topics
  # POST /topics.json
  def create
    @topic = Topic.new(topic_params)
      if @topic.save
        redirect_to root_path, notice: "Topic #{@topic.caption} was successfully created under #{@topic.super_topic.caption}" 
      else
        render :new
      end
  end

  # PATCH/PUT /topics/1
  # PATCH/PUT /topics/1.json
  def update
    if @topic.update(topic_params)
      redirect_to root_path, notice: "Topic #{@topic.caption} was successfully updated under #{@topic.super_topic.caption}"
    else
      render :edit
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    destroyed_topic = @topic.caption
    destroyed_topic_super_topic = @topic.super_topic.caption
    @topic.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Topic #{destroyed_topic} under #{destroyed_topic_super_topic} was successfully deleted." }
      format.json { head :no_content }
    end
  end

  private
    
    def set_super_topic
      if @topic
        @super_topic = @topic.super_topic
      elsif params[:super_topic_id].present?
        @super_topic = SuperTopic.find(params[:super_topic_id])
      else
        @super_topic = SuperTopic.find(params[:id])
      end
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def topic_params
      params.require(:topic).permit(:caption, :super_topic_id)
    end
end
