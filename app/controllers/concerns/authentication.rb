# frozen_string_literal: true

module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :admin_login?
  end

  def admin_login?
    logged_in? && current_user.admin?
  end

  def require_admin_login
    unless admin_login?
      redirect_to root_path, alert: "管理者としてログインしてください"
    end
  end

  protected
    def not_authenticated
      redirect_to root_path, alert: "ログインしてください"
    end
end
