require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @event = events(:event1)
    @user = @event.organizer
    @event.registration_id = 1
    @logged_as = users(:patrice)
    sign_in @logged_as
    #ActiveRecord::Base.connection.reset_pk_sequence!('events')
  end

  test "should get event" do
    I18n.with_locale('en') do
      event_url = event_url(@event, :locale => :fr)
      #p "Event URL: #{event_url}"
      get event_url
      assert_response :success
    end
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "redirects get new if not logged in" do
    sign_out @logged_as
    get new_event_url
    assert_response :redirect
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    assert_difference("Event.count") do
      post events_url( locale: :fr), params: { event: { address: @event.address, date_time: @event.date_time, description: @event.description, directions: @event.directions, organizer_id: @event.organizer.id, participant_count: @event.participant_count, phone_number: @event.phone_number, photo_file_name: @event.photo_file_name, title: @event.title, type: @event.event_type } }
    end

    assert_redirected_to event_url(Event.last, locale: :fr)
  end

  test "should show event" do
      get events_url, params: { event: { address: @event.address, date_time: @event.date_time, description: @event.description, directions: @event.directions, organizer: @event.organizer, participant_count: @event.participant_count, phone_number: @event.phone_number, photo_file_name: @event.photo_file_name, title: @event.title, type: @event.event_type } }
      assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event, locale: :fr)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event, :locale => :fr), params: { event: { address: @event.address, date_time: @event.date_time, description: @event.description, directions: @event.directions, organizer_id: @event.organizer.id, participant_count: @event.participant_count, phone_number: @event.phone_number, photo_file_name: @event.photo_file_name, title: @event.title, type: @event.event_type } }
    assert_redirected_to event_url(@event, locale: :fr)
  end

  test "should destroy event" do
    assert_difference("Event.count", -1) do
      delete event_url(@event, locale: :fr)
    end

    assert_redirected_to events_url(locale: :fr)
  end

end
