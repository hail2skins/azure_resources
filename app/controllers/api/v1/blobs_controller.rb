module Api
  module V1

    class BlobsController < VersionController
      before_action :set_blob, only: [:show, :update, :destroy]
    
      # GET /blobs
      def index
        @blobs = Blob.all
      end
    
      # GET /blobs/1
      def show
      end
    
      def create
      # POST /blobs
        @blob = Blob.find_by(name: params[:blob][:name])
        
        respond_to do |format|
          if @blob
            if compare_params
              format.json { render :show, status: :created, location: @blob }
            else
              if @blob.update(blob_params)
                format.json { render :show, status: :ok, location: @blob }
              else
                format.json { render json: @blob.errors, status: :unprocessable_entity }
              end         
            end
          else
            @blob = Blob.new(blob_params)
      
            if @blob.save
              format.json { render :show, status: :ok, location: @blob }
            else
              format.json { render json: @blob.errors, status: :unprocessable_entity }
            end
          end
        end
      end
  
      # PATCH/PUT /blobs/1
      def update
        respond_to do |format|
          if @blob.update(blob_params)
            format.json { render :show, status: :ok, location: @blob }
          else
            format.json { render json: @blob.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /blobs/1
      def destroy
        @blob.destroy
        respond_to do |format|
          format.html { redirect_to blobs_url, notice: 'Blob was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        def compare_params
          [params["name"],
           params["last_modified"],
           params["length"]].uniq == 
          [@blob.name,
           @blob.last_modified,
           @blob.length]
        end
        
        # Use callbacks to share common setup or constraints between actions.
        def set_blob
          @blob = Blob.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def blob_params
          params.require(:blob).permit(:name, :length, :last_modified)
        end
    end
  end
end
