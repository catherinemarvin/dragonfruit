class SourceImagesController < ApplicationController
  # GET /source_images
  # GET /source_images.json
  def index
    @source_images = SourceImage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @source_images }
    end
  end

  # GET /source_images/1
  # GET /source_images/1.json
  def show
    @source_image = SourceImage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @source_image }
    end
  end

  # GET /source_images/new
  # GET /source_images/new.json
  def new
    @source_image = SourceImage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @source_image }
    end
  end

  # GET /source_images/1/edit
  def edit
    @source_image = SourceImage.find(params[:id])
  end

  # POST /source_images
  # POST /source_images.json
  def create
    @source_image = SourceImage.new(params[:source_image])

    respond_to do |format|
      if @source_image.save
        format.html { redirect_to @source_image, notice: 'Source image was successfully created.' }
        format.json { render json: @source_image, status: :created, location: @source_image }
      else
        format.html { render action: "new" }
        format.json { render json: @source_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /source_images/1
  # PUT /source_images/1.json
  def update
    @source_image = SourceImage.find(params[:id])

    respond_to do |format|
      if @source_image.update_attributes(params[:source_image])
        format.html { redirect_to @source_image, notice: 'Source image was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @source_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_images/1
  # DELETE /source_images/1.json
  def destroy
    @source_image = SourceImage.find(params[:id])
    @source_image.destroy

    respond_to do |format|
      format.html { redirect_to source_images_url }
      format.json { head :no_content }
    end
  end
end
