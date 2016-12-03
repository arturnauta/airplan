module VcHelper
  def current_user
    @current_user ||= current_client ? current_client : current_admin ? current_admin
  end
end
