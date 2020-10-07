class AdminMailer < Devise::Mailer
  default from: 'yo-mismo@example.com'
  layout 'mailer'

  def new_user_waiting_for_approval(email)
    @email = email
    mail(to: 'sebasuraa@gmail.com', subject: 'New User Awaiting Admin Approval')
  end
end
