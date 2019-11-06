class AttendancesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  before_action :set_user
  before_action :set_attendance, only: [:destroy]

  def show
    @event = Event.find(params[:id])
  end

  # POST /attendances
  def create
    @attendance = Attendance.new(attendance_params)
    if @attendance.save
      flash[:success] = "Votre participation sera notifié à l'organisateur"
    else
      flash[:warning] = "Vous participation n'a pas pu être sauvegarder. Contacter l'organisateur pour de plus amples informations"
    end
      
    redirect_back(fallback_location: attendances_path)
  end

  # DELETE /attendances/1
  def destroy
    @attendance.destroy
    flash[:danger] = 'Votre participation a été annulée'
    redirect_back(fallback_location: attendances_path)
  end

  private
    def set_attendance
      @attendance = Attendance.find(params[:id])
    end

    def set_user
      @user = User.find(current_user.id)
    end

    def attendance_params
      params.require(:attendance).permit(:event_id, :user_id)
    end

end
