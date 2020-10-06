class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :appointments, dependent: :destroy
  belongs_to :role

  # Mass assignment is a feature of Rails which allows an application to create
  # a record from the values of a hash. Example: User.new(params[:user])
  # Unfortunately, if there is a user field called admin which controls
  # administrator access, now any user can make themselves an administrator
  # with a query like.
end
