# frozen_string_literal: true

class LeavesController < ApplicationController
  before_action :provide_leave, only: %i[show edit update destroy]

  def index
    @leave = Leave.new
    @leaves = Leave.all.order(created_at: :desc)
  end

  def new
    @leave = Leave.new
  end

  def create
    @leave = Leave.new(leave_params)

    respond_to do |format|
      if @leave.save
        format.html
        format.js
        redirect_to @leave
      else
        format.html
        format.js
        render 'new'
      end
    end
  end

  def edit; end

  def show; end

  def update
    respond_to do |format|
      if @leave.update(leave_params)
        format.html
        format.js
        redirect_to @leave
      else
        format.html
        format.js
        render 'edit'
      end
    end
  end

  def destroy
    @leave = Leave.find(params[:id])
    @leave.destroy!
    respond_to do |format|
      format.js
      format.html { redirect_to leaves_path, notice: 'Request was successfully deleted.' }
    end
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
