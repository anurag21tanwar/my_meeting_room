var init_my_meetings;
init_my_meetings = function() {
    $('.meetings_calendar').each(function() {
        var my_meetings = $(this);
        my_meetings.fullCalendar({
            schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
            header: {
                left: 'prev, next today',
                center: 'title',
                right: 'month, agendaWeek, agendaDay'
            },
            defaultView: 'agendaWeek',
            events: '/meetings.json'
        });
    });
};

$(document).on('turbolinks:load', init_my_meetings);

var init_rooms;
init_rooms = function() {
    $('.rooms_calendar').each(function() {
        var rooms = $(this);
        rooms.fullCalendar({
            schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
            header: {
                left: 'prev, next today',
                center: 'title',
                right: 'timelineDay, timelineWeek'
            },
            defaultView: 'timelineDay',
            resourceColumns: [
                {
                    labelText: 'Rooms',
                    field: 'name'
                }
            ],
            resources: '/rooms.json',
            events: '/meetings.json?rooms=true'
        });
    });
};

$(document).on('turbolinks:load', init_rooms);
