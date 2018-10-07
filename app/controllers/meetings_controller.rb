class MeetingsController < ApplicationController
  def index
    @meetings = Meeting.all
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
        booked_by: Employee.first.id
      )
    )
    if @participants.present? && @meeting.save
      @meeting.employees << @participants
      redirect_to :root
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def show

  end

  def delete

  end

  private

  def meeting_params
    params.require(:meeting).permit(:title, :conference_room_id, :agenda)
  end

  def convert_datetime(d, t)
    DateTime.new(d.year, d.month, d.day, t.hour, t.min)
  end
end
