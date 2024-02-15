class AttendancesController < ApplicationController
  before_action :authenticate_user!
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = current_user.attendances.build(attendance_params)
    
    if @attendance.save
      redirect_to root_path, staus: :see_other
      flash[:success] = "Successfully added Attendance!."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @attendance = current_user.attendances.find(params[:id])

    @attendance.destroy!

      
  end

  private
    def attendance_params
      params.require(:attendance).permit(:event_id)
    end
end
