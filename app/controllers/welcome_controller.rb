class WelcomeController < ApplicationController
  def index
  	@systems = System.all
  	@containers = Container.all
  end
end
