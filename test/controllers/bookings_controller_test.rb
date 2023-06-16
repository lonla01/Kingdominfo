require "test_helper"

class BookingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @annick = users(:annick)
    @event = events(:event1)
    @booking = bookings(:one)
    @logged_as = users(:patrice)
    sign_in @logged_as
    #ActiveRecord::Base.connection.reset_pk_sequence!('bookings')
  end

  test "should get index" do
    get bookings_url(locale: :fr)
    assert_response :success
  end

  test "should get new" do
    get new_booking_url(locale: :fr)
    assert_response :success
  end

  test "should create booking" do
    assert_difference("Booking.count") do
      post bookings_url(locale: :fr), params: { booking: { user_id: @annick.id, event_id: @event.id  } }
    end

    assert_redirected_to booking_url(Booking.last, locale: :fr)
  end

  test "should show booking" do
    get booking_url(@booking, locale: :fr)
    assert_response :success
  end

  test "should get edit" do
    get edit_booking_url(@booking, locale: :fr)
    assert_response :success
  end

  # test "should update booking" do
  #   patch booking_url(@booking, locale: :fr), params: { booking: { user_id: 1, event_id: 1 } }
  #   assert_redirected_to booking_url(@booking, locale: :fr)
  # end

  test "should destroy booking" do
    assert_difference("Booking.count", -1) do
      delete booking_url(@booking, locale: :fr)
    end

    assert_redirected_to bookings_url(locale: :fr)
  end
end
