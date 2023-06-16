class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy register]
  before_action :authenticate_user!, except: %i[index show]

  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to new_user_session_path, notice: "You need to log in before creating a new event!" }
      end
    end
    @event = Event.new
    @event.organizer = current_user unless current_user.nil?
  end

  # GET /events/1/edit
  def edit
  end

  # GET /events/register/1
  def register

    if user_signed_in?
      @id = current_user.id
      if @event.users.include? current_user
        # You have already booked this event
        redirect_to event_url(@event), notice: "You have already booked this event."
      else
        @event.bookings.build(user_id: @id)
        @event.save
        redirect_to event_url(@event), notice: "You have sucessfully booked this event."
      end
    else
      redirect_to new_user_session_path, notice: "You need to log in in order to register for this event."
    end
  end

  # POST /events or /events.json
  def create
    if !user_signed_in?
      respond_to do |format|
        format.html { redirect_to new_user_session_path, notice: "You need to log in before creating a new event!" }
      end
    end
    @event = Event.new(event_params)
    @event.organizer = current_user unless current_user.nil?
    respond_to do |format|
      if @event.save
        format.html { redirect_to event_url(@event), notice: "Event was successfully created." }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:photo_file_name, :organizer, :phone_number, :title, :event_type, :date, :time, :description, :participant_count, :address, :directions, :pict_file_name)
    end

end
