module Api
  module V1

    class ContainersController < VersionController
      before_action :set_container, only: [:show, :update, :destroy]
    
      # GET /containers
      def index
        @containers = Container.all
      end
    
      # GET /containers/1
      def show
      end
    
      def create
      # POST /containers
        @container = Container.find_by(name: params[:container][:name])
        
        respond_to do |format|
          if @container
            if compare_params
              format.json { render :show, status: :created, location: @container }
            else
              if @container.update(container_params)
                format.json { render :show, status: :ok, location: @container }
              else
                format.json { render json: @container.errors, status: :unprocessable_entity }
              end         
            end
          else
            @container = Container.new(container_params)
      
            if @container.save
              format.json { render :show, status: :ok, location: @container }
            else
              format.json { render json: @container.errors, status: :unprocessable_entity }
            end
          end
        end
      end
  
      # PATCH/PUT /containers/1
      def update
        respond_to do |format|
          if @container.update(container_params)
            format.json { render :show, status: :ok, location: @container }
          else
            format.json { render json: @container.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /containers/1
      def destroy
        @container.destroy
        respond_to do |format|
          format.html { redirect_to containers_url, notice: 'Container was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        def compare_params
          [params["name"],
           params["public_access"]].uniq == 
          [@container.name,
           @container.public_access]
        end
        
        # Use callbacks to share common setup or constraints between actions.
        def set_container
          @container = Container.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def container_params
          params.require(:container).permit(:name, :public_access)
        end
    end
  end
end
