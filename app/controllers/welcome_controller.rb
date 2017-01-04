class WelcomeController < ApplicationController
  def index
  	@systems = System.all
  	@containers = Container.all
  	@blobs = Blob.all
  	@nsgs = Nsg.all
  end
end
