class StaticPagesController < ApplicationController
  def home
  	@user = User.new
  end

  def help
  	@message = "Help me!!!!"
  end

  def beginProcess
  	logger.debug "beginning the process"

  	#@x = { 'photoId' => 1234, 'photoName' => "asdfasdf" }
  	#render :json => @x.to_json
  	#logger.debug "woo yeah"

  	logger.debug(params[:user])

  	
  	@user = User.new(params[:user])

  	if @user.save
  		source = rand(SourceImage.count) + 1
  		obj = { :gameId => params[:user][:game], :sourceImage => source, :started => false }
  		alreadyExtant = Game.find(:all, { :conditions => {:gameId => obj[:gameId] } } )
      
      #save user information in a cookie

      cookies[:name] = @user.name
      cookies[:game] = @user.game

      if alreadyExtant.length == 0 #if a game with this name doesn't exist, create it
        logger.debug "game with this name doesn't exist"
        logger.debug(obj)
        @game = Game.new(obj)

    		if @game.save
          logger.debug "everything is good"
          logger.debug @game.id.to_s
    			#render json: @user.to_json
          redirect_to '/games/'+@game.id.to_s
    		else
          logger.debug "cannot save the game"
          logger.debug @game.started
          
    			render json: { :errors => @game.errors }.to_json
    		end
      else #otherwise the game exists and you should simply join it
        logger.debug "already exists son"
        @game = alreadyExtant[0]
        redirect_to '/games/'+@game.id.to_s
      end

  	else
  		#render json: @user.errors, status: :unprocessable_entity
  		render json: { :errors => @user.errors }.to_json
  	end
  	

  end
end
