class ChargesController < ApplicationController

  def new
    @event = Event.find(params[:attendance_id])

   # TODO: cette methode sans lien une fois le paiement validé "" attendances_path({ :attendance => { :event_id => @event.id, :user_id => current_user.id } }), method: :post ""
  
  end

  def create
    # Amount in cents
    @event = Event.find(params[:attendance_id])
    @amount = @event.price
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer:  current_user.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })

    @attendance = Attendance.new

    if @attendance.save
      redirect_to create_attendances_path(@event.id)
      flash[:success]= "Ta participation est enregistrée !"
    else
      render new_event_charge_path
    end
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
