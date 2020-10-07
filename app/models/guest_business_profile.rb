class GuestBusinessProfile < ApplicationRecord
  has_one :user, as: :profile, dependent: :destroy

  def become_member(member_profile)
    user.profile = member_profile
    user.save!
  end
end
