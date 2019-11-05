class StaticPagesController < ApplicationController
  before_action :authenticate_user!, only: [:secret, :show]
  
  def index
    @events = Event.all
  end

  def secret
  end

  def team
  end

  def contact
  end

  def show
    @user = current_user
    @events = Event.all
  end
end
