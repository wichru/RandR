class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @leaves = policy_scope(Leave).order(created_at: :desc)
  end
end
