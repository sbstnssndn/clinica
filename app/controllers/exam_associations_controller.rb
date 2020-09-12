class ExamAssociationsController < ApplicationController
  before_action :set_exam_association, only: [:show, :edit, :update, :destroy]

  # GET /exams
  # GET /exams.json
  def index
    @exam_associations = ExamAssociation.all
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
  end

  # GET /exams/new
  def new
    @exam_association = ExamAssociation.new
  end

  # GET /exams/1/edit
  def edit
  end

  # POST /exams
  # POST /exams.json
  def create
    @exam_association = ExamAssociation.new(exam_association_params)

    respond_to do |format|
      if @exam_association.save
        format.html { redirect_to @exam_association, notice: 'Exam association was successfully created.' }
        format.json { render :show, status: :created, location: @exam_association }
      else
        format.html { render :new }
        format.json { render json: @exam_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam_association.update(exam_association_params)
        format.html { redirect_to edit_exam_association_path(@exam_association), notice: 'Actualizado!' }
        #format.json { render :show, status: :ok, location: @exam_association }
      else
        format.html { render :edit }
        #format.json { render json: @exam_association.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam_association.destroy
    respond_to do |format|
      format.html { redirect_to edit_exam_association_path(@exam_association), notice: 'Destruído!' }
      #format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_exam_association
    @exam_association = ExamAssociation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def exam_association_params
    params.require(:exam_association).permit!
    # params.require(:exam).permit(:name, exam_associations_attributes: [:order, :exam_battery_id])
  end
end
