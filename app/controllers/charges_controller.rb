class ChargesController < ApplicationController

  def new
    @event = Event.find(params[:attendance_id])

   # TODO: cette methode sans lien une fois le paiement validé "" attendances_path({ :attendance => { :event_id => @event.id, :user_id => current_user.id } }), method: :post ""
  
  end

  def create
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
