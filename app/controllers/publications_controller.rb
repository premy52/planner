class PublicationsController < ApplicationController
  before_action :set_client, except: :index
  before_action :set_publication, only: [:show, :edit, :update, :destroy]

  # GET /publications
  # GET /publications.json
  def index
    @publications = Publication.all.order(:pub_name)
  end

  # GET /publications/1
  # GET /publications/1.json
  def show
    @publication = Publication.find_by(publication_params)
  end

  # GET /publications/new
  def new
    @publication = @client.publications.new
  end

  # GET /publications/1/edit
  def edit
  end

  # POST /publications
  # POST /publications.json
  def create
    @publication = Publication.new(publication_params)
    if @publication.save
      redirect_to root_path, notice: "Publication #{@publication.pub_name} was successfully created for #{@publication.client.client_name}" 
    else
      render :new
    end
  end

  # PATCH/PUT /publications/1
  # PATCH/PUT /publications/1.json
  def update
      if @publication.update(publication_params)
        redirect_to root_path, notice: "Publication #{@publication.pub_name} was successfully updated for #{@publication.client.client_name}"
      else
        render :edit
      end
  end

  # DELETE /publications/1
  # DELETE /publications/1.json
  def destroy
    deleted_publication = @publication.pub_name
    deleted_publication_client = @publication.client.client_name
    @publication.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: "Publication #{deleted_publication} for #{deleted_publication_client} was successfully deleted" }
      format.json { head :no_content }
    end
  end

  private
    def set_client
      if @publication
        @client = @publication.client
      elsif params[:client_id].present?
        @client = Client.find(params[:client_id])
      else
        @client = Client.find(params[:id])
      end
    end

    def set_publication
      @publication = Publication.find(params[:id])
    end

    def publication_params
      params.require(:publication).permit(:pub_name, :client_id)
    end
end
