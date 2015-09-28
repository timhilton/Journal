module Api::JournalsHelper

  def current_api_user!
    @current_user ||= User.find_by(token: params[:token]) unless nil
  end
  end
