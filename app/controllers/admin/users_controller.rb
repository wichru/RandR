class Admin::UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_path, notice: 'User was successfully created!' }
        format.json { render json: @user, status: :created, location: [:admin, @user] }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully deleted!'}
      format.js
    end
  end
end
