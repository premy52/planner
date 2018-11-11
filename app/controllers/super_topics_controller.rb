class SuperTopicsController < ApplicationController
  before_action :set_super_topic, only: [:show, :edit, :update, :destroy]

  # GET /super_topics
  # GET /super_topics.json
  def index
    @super_topics = SuperTopic.all.order(:caption)
  end

  # GET /super_topics/1
  # GET /super_topics/1.json
  def show
  end

  # GET /super_topics/new
  def new
    @super_topic = SuperTopic.new
  end

  # GET /super_topics/1/edit
  def edit
  end

  # POST /super_topics
  # POST /super_topics.json
  def create
    @super_topic = SuperTopic.new(super_topic_params)

    respond_to do |format|
      if @super_topic.save
        format.html { redirect_to @super_topic, notice: 'Super topic was successfully created.' }
        format.json { render :show, status: :created, location: @super_topic }
      else
        format.html { render :new }
        format.json { render json: @super_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /super_topics/1
  # PATCH/PUT /super_topics/1.json
  def update
    respond_to do |format|
      if @super_topic.update(super_topic_params)
        format.html { redirect_to @super_topic, notice: 'Super topic was successfully updated.' }
        format.json { render :show, status: :ok, location: @super_topic }
      else
        format.html { render :edit }
        format.json { render json: @super_topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /super_topics/1
  # DELETE /super_topics/1.json
  def destroy
    destroyed_super_topic = @super_topic.caption
    @super_topic.destroy
    respond_to do |format|
      format.html { redirect_to super_topics_url, notice: "Super topic #{destroyed_super_topic} was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_super_topic
      @super_topic = SuperTopic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def super_topic_params
      params.require(:super_topic).permit(:caption)
    end
end
