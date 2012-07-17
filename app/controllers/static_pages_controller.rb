class StaticPagesController < ApplicationController
  def home
  end

  def help
  	@message = "Help me!!!!"
  end
end
