class BatteriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_battery, only: [:show, :edit, :update, :destroy, :edit_order]

  # GET /batteries
  # GET /batteries.json
  def index
    @batteries = Battery.all
  end

  # GET /batteries/1
  # GET /batteries/1.json
  def show
    @exam_selections = @battery.exam_selections.order(:order)
  end

  # GET /batteries/new
  def new
    @battery = Battery.new(order: Battery.next_order)
    @battery.exams.build
  end

  # GET /batteries/1/edit
  def edit
  end

  # POST /batteries
  # POST /batteries.json
  def create
    @battery = Battery.new(battery_params)

    respond_to do |format|
      if @battery.save
        format.html { redirect_to @battery, notice: 'Battery was successfully created.' }
        format.json { render :show, status: :created, location: @battery }
      else
        format.html { render :new }
        format.json { render json: @battery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batteries/1
  # PATCH/PUT /batteries/1.json
  def update
    respond_to do |format|
      if @battery.update(battery_params)
        format.html { redirect_to @battery, notice: 'Battery was successfully updated.' }
        format.json { render :show, status: :ok, location: @battery }
      else
        format.html { render :edit }
        format.json { render json: @battery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batteries/1
  # DELETE /batteries/1.json
  def destroy
    @battery.destroy
    respond_to do |format|
      format.html { redirect_to batteries_url, notice: 'Battery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /batteries/1/edit_order => order
  def edit_order
  end

  def update_order
    Battery.update(params[:batteries].keys, params[:batteries].values)
    redirect_to batteries_url, notice: 'Orden actualizado!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_battery
      @battery = Battery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def battery_params
      params.require(:battery).permit(
        :name,
        :certification,
        :order,
        exam_ids: [],
        exams_attributes: [
          :id, :name, :price
        ],
        exam_selections_attributes: [
          :id, :order, :exam_id, :battery_id
        ],
        battery_offerings_attributes: [
          :id, :price, :branch_id, :battery_id
        ]
      )
    end
end
