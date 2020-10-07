class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :toggle_approbation]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    @user.password = Devise.friendly_token.first(8)

    respond_to do |format|
      if @user.save
        @user.send_reset_password_instructions
        format.html { redirect_to users_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    # Remove password from params if it's blank of Devise fails validations
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /admin/users/profile_partial?profileType=CesoProfile
  def profile_partial
    @user = User.new
    @user.profile = params[:profile_type].constantize.new
    @profile_type = User.parse_profile_type params[:profile_type]
  end

  # PUT /admin/users/:id/toggle_approbation
  def toggle_approbation
    @user.approved = @user.approved? ? false : true
    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path, notice: 'Se actualizó la aprobación' }
      else
        format.html { render :index }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :email,
      :role_id,
      :profile_type,
      profile_attributes: [:id, :name, :branch_id, :last_name, :payment_agreement]
    )
  end

  def set_user
    @user = User.find(params[:id])
  end
end