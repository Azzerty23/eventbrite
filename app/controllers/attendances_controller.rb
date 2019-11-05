class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
    @attendances = Attendance.where(user_id: current_user)
  end

  def new
    @attendance = Attendance.new
  end

  def create
    
  end

end
