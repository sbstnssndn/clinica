class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments, dependent: :destroy
  belongs_to :role

  belongs_to :profile, polymorphic: true
  accepts_nested_attributes_for :profile

  after_create :send_admin_mail

  PROFILE_TYPES = ['CesoProfile', 'BusinessProfile']

  # rails g model GuestBusinessProfile name last_name position phone
  # rails g model GuestPersonProfile name last_name position phone rut passport address birth_date:date
  # rails g model BusinessProfile name last_name username branch:belongs_to payment_agreement
  # rails g model CesoProfile name last_name branch:belongs_to
  #
  #
  # rails g model Business name address rut activity

  def self.parse_profile_type(profile_name)
    profile_type_name = PROFILE_TYPES.detect { |p| profile_name == p }
    profile_type_name.underscore.downcase if profile_type_name.present?
  end

  # Necesario para que el formulario de registro con fields_for cree el
  # perfil según el tipo que se le pasa como hidden field
  def build_profile(params)
    self.profile = profile_type.constantize.new(params)
  end

  # Mass assignment is a feature of Rails which allows an application to create
  # a record from the values of a hash. Example: User.new(params[:user])
  # Unfortunately, if there is a user field called admin which controls
  # administrator access, now any user can make themselves an administrator
  # with a query like.


  # Activación de cuenta por parte de un admin
  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    approved? ? super : :not_approved
  end

  def send_admin_mail
    # Acá va un mail avisándole a un admin que alguien se registró
    AdminMailer.new_user_waiting_for_approval(email).deliver
  end

  def self.send_reset_password_instructions(attributes={})
    recoverable = find_or_initialize_with_errors(reset_password_keys, attributes, :not_found)
    if !recoverable.approved?
      recoverable.errors[:base] << I18n.t("devise.failure.not_approved")
    elsif recoverable.persisted?
      recoverable.send_reset_password_instructions
    end
    recoverable
  end
  # Fin activación de cuenta por parte de un admin
end
