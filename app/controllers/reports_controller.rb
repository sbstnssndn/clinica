class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
  end

  # GET /reports/1/edit
  def edit
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save
        @report.create_form_values!
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  def bulk_create
    report_params[:patient_ids].each do |patient_id|
      report = Report.new(
        patient_id: patient_id,
        appointment_id: report_params[:appointment_id]
      )

      if report.save
        report.create_form_values!
      else
        return render :show, alert: "Error creando reporte para #{Patient.find_by_id(patient_id).name}"
      end
    end

    redirect_to reports_path, notice: 'Reports were successfully created.'
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def report_params
      params.require(:report).permit!
      # params.require(:report).permit(
      #   :completed,
      #   :patient_id,
      #   :conclusions,
      #   :appointment_id,
      #   form_values_attributes: [:id, :form_field_id, :report_id, :value],
      #   patient_attributes: [:id, :name, :rut, :phone],
      #   patient_ids: []
      # )
    end
end
