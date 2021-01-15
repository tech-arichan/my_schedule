class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :show]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_parameter)
    redirect_to root_path
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
  end

  def edit
  end

  def update
    event = Event.find(params[:id])
    event.update(event_parameter)
    redirect_to root_path
  end

  def show
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
