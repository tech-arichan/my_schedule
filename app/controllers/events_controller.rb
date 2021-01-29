class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :show]

  def index
    @events = Event.includes(:user)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      redirect_to new_event_path
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    event = Event.find(params[:id])
    event.update(event_params)
    redirect_to root_path
  end

  def show
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
