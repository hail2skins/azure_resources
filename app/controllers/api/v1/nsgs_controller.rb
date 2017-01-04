module Api
  module V1

    class NsgsController < VersionController
      before_action :set_nsg, only: [:show, :update, :destroy]
    
      # GET /nsgs
      def index
        @nsgs = Nsg.all
      end
    
      # GET /nsgs/1
      def show
      end
    
      def create
      # POST /nsgs
        @nsg = Nsg.find_by(name: params[:nsg][:name])
        
        respond_to do |format|
          if @nsg
            if compare_params
              format.json { render :show, status: :created, location: @nsg }
            else
              if @nsg.update(nsg_params)
                format.json { render :show, status: :ok, location: @nsg }
              else
                format.json { render json: @nsg.errors, status: :unprocessable_entity }
              end         
            end
          else
            @nsg = Nsg.new(nsg_params)
      
            if @nsg.save
              format.json { render :show, status: :ok, location: @nsg }
            else
              format.json { render json: @nsg.errors, status: :unprocessable_entity }
            end
          end
        end
      end
  
      # PATCH/PUT /nsgs/1
      def update
        respond_to do |format|
          if @nsg.update(nsg_params)
            format.json { render :show, status: :ok, location: @nsg }
          else
            format.json { render json: @nsg.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /nsgs/1
      def destroy
        @nsg.destroy
        respond_to do |format|
          format.html { redirect_to nsgs_url, notice: 'NSG was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        def compare_params
          [params["name"],
           params["resource_group"],
           params["location"],
           params["provisioning_state"]].uniq == 
          [@nsg.name,
           @nsg.resource_group,
           @nsg.location,
           @nsg.provisioning_state]
        end
        
        # Use callbacks to share common setup or constraints between actions.
        def set_nsg
          @nsg = Nsg.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def nsg_params
          params.require(:nsg).permit(:name, 
                                      :resource_group, 
                                      :location, 
                                      :provisioning_state)
        end
    end
  end
end
