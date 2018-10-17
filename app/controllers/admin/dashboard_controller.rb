# frozen_string_literal: true

class Admin::DashboardController < ApplicationController
  before_action :ensure_admin_user!

  def index; end

  def ensure_admin_user!
    redirect_to root_path, notice: 'You are not admin!' unless current_user&.admin?
  end
end
