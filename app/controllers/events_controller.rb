class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_event, only: [:show, :edit, :destroy]

  def index
    @events = Event.all
  end

  def show
    @events = Event.all
  end
  
  def new
    @event = Event.new
  end

  def edit
  end

  def update
    @event = set_event
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = 'Event successfully created'
      redirect_to events_path
    else
      flash.now[:danger] = 'Something went wrong, please check your input'
      render new_event_path
    end
  end


  def destroy
    @event.destroy
      redirect_to events_url, notice: 'Event was successfully destroyed.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :image, :administrator_id)
  end


end
