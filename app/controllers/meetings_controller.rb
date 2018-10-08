class MeetingsController < ApplicationController
  before_action :find_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = current_employee.meetings
    @rooms = true if params[:rooms]
  end

  def new
    @meeting = Meeting.new
  end

  def create
    @participants = Employee.get_participants(params[:meeting][:participants].split(',').map(&:strip))
    @meeting = Meeting.new(
      meeting_params.merge!(
        start_time: convert_datetime(Date.parse(params[:meeting][:date]), Time.parse(params[:meeting][:start_time])),
        end_time: convert_datetime(Date.parse(params[:meeting][:date]), Time.parse(params[:meeting][:end_time])),
        booked_by: current_employee.id
      )
    )
    if @participants.present? && @meeting.save
      @meeting.employees << @participants
      flash.notice = 'Meeting successfully created'
      redirect_to :root
    else
      render :new
    end
  end

  def edit
  end

  def update
    @participants = Employee.get_participants(params[:meeting][:participants].split(',').map(&:strip))
    if @participants.present?
      @meeting.update(
        meeting_params.merge!(
          start_time: convert_datetime(Date.parse(params[:meeting][:date]), Time.parse(params[:meeting][:start_time])),
          end_time: convert_datetime(Date.parse(params[:meeting][:date]), Time.parse(params[:meeting][:end_time])),
          booked_by: current_employee.id
        )
      )
      @meeting.employees.delete(@meeting.employees)
      @meeting.employees << @participants
      flash.notice = 'Meeting successfully updated'
      redirect_to :root
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @meeting&.destroy
    flash.notice = 'Meeting successfully deleted'
    redirect_to :root
  end

  private

  def find_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:title, :conference_room_id, :agenda)
  end

  def convert_datetime(d, t)
    DateTime.new(d.year, d.month, d.day, t.hour, t.min)
  end
end
