class WelcomeController < ApplicationController
  def index
  	@systems = System.all
  end
end
