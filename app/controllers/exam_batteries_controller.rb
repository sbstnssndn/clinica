class ExamBatteriesController < ApplicationController
  before_action :set_exam_battery, only: [:show, :edit, :update, :destroy]

  # GET /exam_batteries
  # GET /exam_batteries.json
  def index
    @exam_batteries = ExamBattery.all
  end

  # GET /exam_batteries/1
  # GET /exam_batteries/1.json
  def show
  end

  # GET /exam_batteries/new
  def new
    @exam_battery = ExamBattery.new
  end

  # GET /exam_batteries/1/edit
  def edit
  end

  # POST /exam_batteries
  # POST /exam_batteries.json
  def create
    @exam_battery = ExamBattery.new(exam_battery_params)

    respond_to do |format|
      if @exam_battery.save
        format.html { redirect_to @exam_battery, notice: 'Exam battery was successfully created.' }
        format.json { render :show, status: :created, location: @exam_battery }
      else
        format.html { render :new }
        format.json { render json: @exam_battery.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_batteries/1
  # PATCH/PUT /exam_batteries/1.json
  def update
    respond_to do |format|
      if @exam_battery.update(exam_battery_params)
        format.html { redirect_to @exam_battery, notice: 'Exam battery was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_battery }
      else
        format.html { render :edit }
        format.json { render json: @exam_battery.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_batteries/1
  # DELETE /exam_batteries/1.json
  def destroy
    @exam_battery.destroy
    respond_to do |format|
      format.html { redirect_to exam_batteries_url, notice: 'Exam battery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_battery
      @exam_battery = ExamBattery.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exam_battery_params
      #params.require(:exam_battery).permit!
      params.require(:exam_battery).permit(:name, :certification, :kind, exam_associations_attributes: [:id, :order, :exam_id, :exam_battery_id, :_destroy])
    end
end
