class GamesImagesController < ApplicationController
  # GET /games_images
  # GET /games_images.json
  def index
    @games_images = GamesImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games_images }
    end
  end

  # GET /games_images/1
  # GET /games_images/1.json
  def show
    @games_image = GamesImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @games_image }
    end
  end

  # GET /games_images/new
  # GET /games_images/new.json
  def new
    @games_image = GamesImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @games_image }
    end
  end

  # GET /games_images/1/edit
  def edit
    @games_image = GamesImage.find(params[:id])
  end

  # POST /games_images
  # POST /games_images.json
  def create
    @games_image = GamesImage.new(params[:games_image])

    respond_to do |format|
      if @games_image.save
        format.html { redirect_to @games_image, notice: 'Games image was successfully created.' }
        format.json { render json: @games_image, status: :created, location: @games_image }
      else
        format.html { render action: "new" }
        format.json { render json: @games_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games_images/1
  # PUT /games_images/1.json
  def update
    @games_image = GamesImage.find(params[:id])

    respond_to do |format|
      if @games_image.update_attributes(params[:games_image])
        format.html { redirect_to @games_image, notice: 'Games image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @games_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games_images/1
  # DELETE /games_images/1.json
  def destroy
    @games_image = GamesImage.find(params[:id])
    @games_image.destroy

    respond_to do |format|
      format.html { redirect_to games_images_url }
      format.json { head :no_content }
    end
  end
end
