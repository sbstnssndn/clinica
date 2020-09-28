class BatteriesController < ApplicationController
  before_action :set_battery, only: [:show, :edit, :update, :destroy]

  # GET /batteries
  # GET /batteries.json
  def index
    @batteries = Battery.all
  end

  # GET /batteries/1
  # GET /batteries/1.json
  def show
  end

  # GET /batteries/new
  def new
    @battery = Battery.new
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
    # TODO: Refactorizar esto, hay que editar un ExamSelection dentro de la vista de baterías
    # tal vez sea mejor crear ExamSelections con nested attrs en vez de exámenes
    params[:battery][:exams_attributes].each do |_, v|
      es = ExamSelection.find_by(
        exam_id: v[:exam_selection][:exam_id],
        battery_id: v[:exam_selection][:battery_id]
      )
      es.update!(order: v[:exam_selection][:order]) if es.present?
    end

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

  # PUT /batteries/edit_order
  def edit_order
    @products = Product.find(params[:product_ids])
    params[:battery_ids]
    Battery.update_all({  })
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
        ]
      )
    end
end
