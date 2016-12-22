class WelcomeController < ApplicationController
  def index
  	@systems = System.all
  	@containers = Container.all
  	@blobs = Blob.all
  end
end
