module Api
  module V1

    class NsgrulesController < VersionController
      before_action :get_nsg_create, only: [:create]
      before_action :get_nsg, only: [:update, :delete, :show]
      before_action :set_nsgrules, only: [:show, :update, :destroy]
    
      # GET /nsgruless
      def index
        @nsgrules = Nsgrule.all
      end
    
      # GET /nsgruless/1
      def show
      end
    
      def create
      # POST /nsgruless
        @nsgrule = Nsgrule.find_by(name: params[:nsgrule][:name])
        
        respond_to do |format|
          if @nsgrule
            if compare_params
              format.json { render :show, status: :created, location: @nsgrule }
            else
              if @nsgrule.update(nsgrules_params)
                format.json { render :show, status: :ok, location: @nsgrule }
              else
                format.json { render json: @nsgrule.errors, status: :unprocessable_entity }
              end         
            end
          else
            @nsgrule = @nsg.nsgrules.new(nsgrules_params)
      
            if @nsgrule.save
              format.json { render :show, status: :ok, location: @nsgrule }
            else
              format.json { render json: @nsgrule.errors, status: :unprocessable_entity }
            end
          end
        end
      end
  
      # PATCH/PUT /nsgruless/1
      def update
        respond_to do |format|
          if @nsgrule.update(nsgrules_params)
            format.json { render :show, status: :ok, location: @nsgrule }
          else
            format.json { render json: @nsgrule.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /nsgruless/1
      def destroy
        @nsgrule.destroy
        respond_to do |format|
          format.html { redirect_to nsgrules_url, notice: 'NSG Rule was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        def get_nsg_create
          @nsg = Nsg.find_by(name: params[:nsgrule][:nsg_name])
        end

        def get_nsg
          @nsg = Nsg.find(params[:nsg_id])
        end

        def compare_params
          [params["name"],
           params["nsg_name"],
           params["direction"],
           params["priority"],
           params["protocol"],
           params["source_port_range"],
           params["destination_port_range"],
           params["source_address_prefix"],
           params["destination_address_prefix"],
           params["access"]].uniq == 
          [@nsgrule.name,
           @nsgrule.nsg_name,
           @nsgrule.direction,
           @nsgrule.priority,
           @nsgrule.protocol,
           @nsgrule.source_port_range,
           @nsgrule.destination_port_range,
           @nsgrule.source_address_prefix,
           @nsgrule.destination_address_prefix,
           @nsgrule.access]
        end
        
        # Use callbacks to share common setup or constraints between actions.
        def set_nsgrules
          @nsgrule = Nsgrule.find(params[:id])
        end
    
        # Only allow a trusted parameter "white list" through.
        def nsgrules_params
          params.require(:nsgrule).permit(:name, 
                                          :nsg_name, 
                                          :direction, 
                                          :priority, 
                                          :protocol, 
                                          :source_port_range, 
                                          :destination_port_range, 
                                          :source_address_prefix, 
                                          :destination_address_prefix, 
                                          :access,
                                          :nsg_id)
        end
    end
  end
end
