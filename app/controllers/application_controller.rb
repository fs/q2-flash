class ApplicationController < ActionController::Base
  protect_from_forgery

  def admin_required
    if !user_signed_in? || !current_user.role?('admin')
      redirect_to(new_user_session_path)
    end
  end
end
