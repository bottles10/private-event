class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    
    if @event.save
      redirect_to event_path(@event), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

    def event_params
      params.require(:event).permit(:title, :location, :description, :date)
    end
end
