class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :profile, polymorphic: true
  has_many :appointments

  # Ciertos usuarios (con rol admin, médico y enfermera) pueden llenar
  # formularios, pero no todos. Quizás se necesita polimorfismo a nivel de users
  has_many :form_values
end
