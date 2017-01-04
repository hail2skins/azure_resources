class NsgsController < ApplicationController
  before_action :set_nsg, only: [:show, :edit, :update, :destroy]

  # GET /nsgs
  # GET /nsgs.json
  def index
    @nsgs = Nsg.all
  end

  # GET /nsgs/1
  # GET /nsgs/1.json
  def show
  end

  # GET /nsgs/new
  def new
    @nsg = Nsg.new
  end

  # GET /nsgs/1/edit
  def edit
  end

  # POST /nsgs
  # POST /nsgs.json
  def create
    @nsg = Nsg.new(nsg_params)

    respond_to do |format|
      if @nsg.save
        format.html { redirect_to @nsg, notice: 'Nsg was successfully created.' }
        format.json { render :show, status: :created, location: @nsg }
      else
        format.html { render :new }
        format.json { render json: @nsg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nsgs/1
  # PATCH/PUT /nsgs/1.json
  def update
    respond_to do |format|
      if @nsg.update(nsg_params)
        format.html { redirect_to @nsg, notice: 'Nsg was successfully updated.' }
        format.json { render :show, status: :ok, location: @nsg }
      else
        format.html { render :edit }
        format.json { render json: @nsg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nsgs/1
  # DELETE /nsgs/1.json
  def destroy
    @nsg.destroy
    respond_to do |format|
      format.html { redirect_to nsgs_url, notice: 'Nsg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nsg
      @nsg = Nsg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nsg_params
      params.require(:nsg).permit(:name, :resource_group, :location, :provisioning_state)
    end
end
