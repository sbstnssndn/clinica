class AdministrativeProfile < ApplicationRecord
  has_one :user, as: :profile, dependent: :destroy

  def fields
    {name: 'Nombre', last_name: 'Apellido', email: 'Correo electrónico'}
  end
end
