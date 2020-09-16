module UsersHelper
  def show_profile_fields(user)
    profile_info = []
    user.profile.fields.each do |field, title|
      profile_info << { title: title, data: user.profile.send(field) }
    end
    profile_info
  end

  def profile_titles(user)
    titles = []
    user.profile.fields.each do |_, title|
      titles << title
    end
    titles
  end

  def profile_data(user)
    data = []
    user.profile.fields.each do |field, _|
      data << user.profile.send(field)
    end
    data
  end
end
