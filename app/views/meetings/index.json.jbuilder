if @rooms
  json.array!(@meetings) do |meeting|
    json.id meeting.id
    json.resourceId meeting.conference_room_id
    json.start meeting.start_time
    json.end meeting.end_time
    json.title 'Busy'
  end
else
  json.array!(@meetings) do |meeting|
    json.start meeting.start_time
    json.end meeting.end_time
    json.title meeting.title
    json.url "/meetings/#{meeting.id}"
  end
end
