class ApplicationController < ActionController::Base
  before_action :set_current_user
  def set_current_user
    User.current_id = cookies.signed[:user_id]
  end
end
