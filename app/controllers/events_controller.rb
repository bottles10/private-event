class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_params, only: [:show, :edit, :update, :destroy]
  def index
    @events = Event.all
  end

  def show
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

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), status: :see_other
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @event.destroy!
      
      redirect_to events_path, status: :see_other
    end

  private

  def find_params
    @event = Event.find(params[:id])
  end

    def event_params
      params.require(:event).permit(:title, :location, :description, :date)
    end
end
