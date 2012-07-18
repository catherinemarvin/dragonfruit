class GamesController < ApplicationController
  # GET /games
  # GET /games.json
  def index
    @games = Game.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @games }
    end
  end

  # GET /games/1
  # GET /games/1.json
  def show
    logger.debug "Show me the money"
    @game = Game.find(params[:id])
    @sourceUrl = SourceImage.find(@game[:sourceImage])[:url]
    logger.debug @sourceUrl

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @game }
    end
  end

  # POST /games/1/submit
  # adds an image!!!

  def addImage
    logger.debug "Adding image!!!"
    logger.debug params[:id]
    logger.debug params[:url]
    logger.debug params[:name]

    obj = { :gameId => params[:id], :imageUrl => params[:url], :votes => 0, :userSubmitted => params[:name]}
    @added = GamesImage.new(obj)

    if @added.save
      logger.debug "Save went great!"
    else
      logger.debug "Something went terribly wrong with the save!!"
    end
    render :nothing => true
  end

  # GET /games/1/getImages
  # returns the images

  def getImages
    logger.debug "Fetching images..."
    logger.debug params[:id]
    images = GamesImage.find(:all, { :conditions => {:gameId => params[:id] } } )
    logger.debug images
    toReturn = images.map do |e|
      { :url => e.imageUrl, :submittedBy => e.userSubmitted }
    end
    render json: toReturn.to_json
  end

  # POST /games/1/vote
  # vote for an image

  def vote
    logger.debug "Exercising constitutional right to vote..."
    logger.debug params[:id]
    logger.debug params[:userId]
    gameImg = GamesImage.find(:first, { :conditions => { :gameId => params[:id], :userSubmitted => params[:userId]} } )
    gameImg.votes += 1
    if gameImg.save
      logger.debug "Logged your vote!"
      render :nothing => true
    else
      logger.debug "Something went horribly wrong"
    end

  end

  # POST /games/1
  #you should flip the started bit to TRUE
  def start
    logger.debug "Starting game!!!"
    logger.debug params[:id]
    @game = Game.find(params[:id])
    @sourceUrl = SourceImage.find(@game[:sourceImage])[:url]
    if @game.started == true
      logger.debug "You've already started a game :("
    else
      logger.debug "Starting the game!"
      @game.started = true
      @game.save
      render :action => "show"
    end
    #render :nothing => true
  end


  # GET /games/new
  # GET /games/new.json
  def new
    @game = Game.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @game }
    end
  end

  # GET /games/1/edit
  def edit
    @game = Game.find(params[:id])
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(params[:game])

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render json: @game, status: :created, location: @game }
      else
        format.html { render action: "new" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /games/1
  # PUT /games/1.json
  def update
    @game = Game.find(params[:id])

    respond_to do |format|
      if @game.update_attributes(params[:game])
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game = Game.find(params[:id])
    @game.destroy

    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end
end
