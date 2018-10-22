# frozen_string_literal: true

class LeavesController < ApplicationController
  before_action :provide_leave, only: %i[show edit update destroy approval]
  before_action :authenticate_user!

  def index
    @leave = Leave.new
    @leaves = policy_scope(Leave).order(created_at: :desc)
  end

  def new
    @leave = Leave.new
  end

  def create
    @leave = Leave.new(leave_params)
    @user = User.new


    if @leave.save
      redirect_to leaves_path
    else
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    respond_to do |format|
      if @leave.update(leave_params)
        format.html { redirect_to @leave }
        format.js
      else
        format.html { render :edit }
        format.js
      end
    end
  end

  def destroy
    @leave.destroy!
    respond_to do |format|
      format.html { redirect_to leaves_path, notice: 'Request was successfully deleted.' }
      format.js
    end
  end

  def approval
    @leave.update(status: true)
    if @leave.status == true
      redirect_to admin_leaves_path, notice: 'Request successfully approved'
    else
      redirect_to admin_leaves_path, notice: 'Request rejected'
    end
  end

  private

  def leave_params
    params.require(:leave).permit(:start_date, :end_date, :leave_type,
                                  :reason_for_leave).merge(user: current_user)
  end

  def provide_leave
    @leave = Leave.find(params[:id])
  end
end
