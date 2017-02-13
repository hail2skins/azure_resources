class NsgrulesController < ApplicationController
  before_action :get_nsg, except: [:index]
  before_action :set_nsgrule, only: [:show, :edit, :update, :destroy]

  # GET /nsgrules
  # GET /nsgrules.json
  def index
    @q = Nsgrule.ransack(params[:q])
    @q.sorts = 'nsg_name asc' if @q.sorts.empty?
    @nsgrules = @q.result(distinct: true)
    @q.build_condition    
    #@nsgrules = Nsgrule.all
  end

  # GET /nsgrules/1
  # GET /nsgrules/1.json
  def show
  end

  # GET /nsgrules/new
  def new
    @nsgrule = Nsgrule.new
  end

  # GET /nsgrules/1/edit
  def edit
  end

  # POST /nsgrules
  # POST /nsgrules.json
  def create
    @nsgrule = Nsgrule.new(nsgrule_params)

    respond_to do |format|
      if @nsgrule.save
        format.html { redirect_to @nsgrule, notice: 'Nsgrule was successfully created.' }
        format.json { render :show, status: :created, location: @nsgrule }
      else
        format.html { render :new }
        format.json { render json: @nsgrule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nsgrules/1
  # PATCH/PUT /nsgrules/1.json
  def update
    respond_to do |format|
      if @nsgrule.update(nsgrule_params)
        format.html { redirect_to @nsgrule, notice: 'Nsgrule was successfully updated.' }
        format.json { render :show, status: :ok, location: @nsgrule }
      else
        format.html { render :edit }
        format.json { render json: @nsgrule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nsgrules/1
  # DELETE /nsgrules/1.json
  def destroy
    @nsgrule.destroy
    respond_to do |format|
      format.html { redirect_to nsgrules_url, notice: 'Nsgrule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nsgrule
      @nsgrule = Nsgrule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nsgrule_params
      params.require(:nsgrule).permit(:name, :nsg, :direction, :priority, :protocol, :source_port_range, :destination_port_range, :source_address_prefix, :destination_address_prefix, :access)
    end

    def get_nsg
      @nsg = Nsg.find(params[:nsg_id])
    end
end
