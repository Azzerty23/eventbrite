class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :destroy]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
  end
  
  def new
    @event = Event.new
  end

  def edit
  end

  def update
    if @user.update(event_params)
      redirect_to @event, notice: 'User was successfully updated.'
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
      flash.now[:danger] = 'Something wen wrong, please check your input'
      render :new
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
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :administrator)
  end


end
