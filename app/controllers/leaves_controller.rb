# frozen_string_literal: true

class LeavesController < ApplicationController
  before_action :provide_leave, only: %i[show edit update destroy]

  def index
    @leave = Leave.new
    @leaves = Leave.all
  end

  def new
    @leave = Leave.new
  end

  def create
    @leave = Leave.new(leave_params)

    if @leave.save
      redirect_to @leave
    else
      render 'new'
    end
  end

  def edit; end

  def show; end

  def update
    if @leave.update(leave_params)
      redirect_to @leave
    else
      render 'edit'
    end
  end

  def destroy
    @leave.destroy!
    respond_to do |format|
      format.js
      format.html { redirect_to leaves_path, notice: 'Request was successfully deleted.' }
      format.json { render json: @leave, status: :ok, location: @leave }
    end

    redirect_to leaves_path
  end

  private

  def leave_params
    params.require(:leave).permit(:start_date, :end_date, :leave_type,
                                  :reason_for_leave)
  end

  def provide_leave
    @leave = Leave.find(params[:id])
  end
end
