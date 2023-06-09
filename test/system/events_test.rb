require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
    #ActiveRecord::Base.connection.reset_pk_sequence!('events')
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "should create event" do
    visit events_url
    click_on "New event"

    fill_in "Address", with: @event.address
    fill_in "Date time", with: @event.date_time
    fill_in "Description", with: @event.description
    fill_in "Directions", with: @event.directions
    fill_in "Organizer", with: @event.organizer
    fill_in "Participant count", with: @event.participant_count
    fill_in "Phone number", with: @event.phone_number
    fill_in "Photo file name", with: @event.photo_file_name
    fill_in "Title", with: @event.title
    fill_in "Event Type", with: @event.event_type
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "should update Event" do
    visit event_url(@event)
    click_on "Edit this event", match: :first

    fill_in "Address", with: @event.address
    fill_in "Date time", with: @event.date_time
    fill_in "Description", with: @event.description
    fill_in "Directions", with: @event.directions
    fill_in "Organizer", with: @event.organizer
    fill_in "Participant count", with: @event.participant_count
    fill_in "Phone number", with: @event.phone_number
    fill_in "Photo file name", with: @event.photo_file_name
    fill_in "Title", with: @event.title
    fill_in "Event Type", with: @event.event_type
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "should destroy Event" do
    visit event_url(@event)
    click_on "Destroy this event", match: :first

    assert_text "Event was successfully destroyed"
  end
end
