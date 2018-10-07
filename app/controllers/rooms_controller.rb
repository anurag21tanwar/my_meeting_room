class RoomsController < ApplicationController
  def index
    @rooms = ConferenceRoom.all
  end
end
