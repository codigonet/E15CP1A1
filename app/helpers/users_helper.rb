module UsersHelper
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged?
    session[:user_id].present? ? true : false
  end
end
