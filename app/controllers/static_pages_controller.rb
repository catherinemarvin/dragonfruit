class StaticPagesController < ApplicationController
  def home
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
  		render json: @user.to_json
  	else
  		#render json: @user.errors, status: :unprocessable_entity
  		render json: { :errors => @user.errors }.to_json
  	end
  	

  end
end
