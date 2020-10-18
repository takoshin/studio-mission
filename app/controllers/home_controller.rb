class HomeController < ApplicationController
  def index
      @customers = Customer.all
      #customer = Customer.find(params[:id])

      @reservations = Reservation.all
      #@reservation = Reservation.find(params[:id])
  end
end
