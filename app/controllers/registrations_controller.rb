class RegistrationsController < Devise::RegistrationsController
  # before_filter :configure_permitted_parameters, if: :devise_controller?
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) {|u|
  #     u.permit(:email, :password, :password_confirmation, :remember_me,
  #              profile_attributes: [:uname, :manager])}
  # end


  # def sign_up_params
  #   devise_parameter_sanitizer.sanitize(:sign_up)
  #   params.require(:user).permit(
  #     :email, :password, profile_attributes: [:name, :last_name]
  #   )
  # end
  #

  def new
    build_resource
    resource.profile = CesoProfile.new
    yield resource if block_given?
    respond_with resource
  end

  PROFILE_TYPES = [CesoProfile]

  def create
    # mío
    begin
      profile_klass = PROFILE_TYPES.detect { |p| sign_up_params[:profile_type].classify.constantize == p }
    ensure
      unless profile_klass
        redirect_to new_user_registration_path, alert: "Incorrect painting type (klass)" and return
      end
    end
    profile_params = sign_up_params.delete :profile_attributes
    # fin mío

    build_resource(sign_up_params)

    # mío
    resource.profile = profile_klass.new profile_params
    resource.profile.branch = Branch.last
    resource.role = Role.last
    # fin mío

    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end
end