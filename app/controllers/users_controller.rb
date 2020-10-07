class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: 'Patient was successfully created.' }
        format.json { render :show, status: :created, location: @patient }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /admin/users/profile_partial?profileType=CesoProfile
  def profile_partial
    @user = User.new
    @profile_type = User.parse_profile_type params[:profile_type]
  end

  private

  def user_params
    params.require(:patient).permit(:email, :role_id, :profile_id)
  end
end