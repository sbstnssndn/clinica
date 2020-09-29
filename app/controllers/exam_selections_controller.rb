class ExamSelectionsController < ApplicationController
  before_action :set_battery, only: [:edit_multiple, :reorder]

  def edit_multiple
    @exam_selections = ExamSelection.where(battery: @battery)
  end

  def reorder
    ExamSelection.update_all({})
  end

  private

  def set_battery
    @battery = Battery.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def exam_selection_params
    params.require(:exam_selection).permit(:order, :exam_id, :battery_id)
  end
end