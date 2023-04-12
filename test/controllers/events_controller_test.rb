require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url, params: { event: { address: @event.address, date_time: @event.date_time, description: @event.description, directions: @event.directions, organizer: @event.organizer, participant_count: @event.participant_count, phone_number: @event.phone_number, photo_file_name: @event.photo_file_name, title: @event.title, type: @event.type } }
    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { address: @event.address, date_time: @event.date_time, description: @event.description, directions: @event.directions, organizer: @event.organizer, participant_count: @event.participant_count, phone_number: @event.phone_number, photo_file_name: @event.photo_file_name, title: @event.title, type: @event.type } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference("Event.count", -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
