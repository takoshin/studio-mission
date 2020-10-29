class ReservationsController < ApplicationController
  def index
    @search_params = reservation_search_params
    @reservations = Reservation.search(@search_params)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @reservation.customer_id = current_customer.id
    @reservation.save
    redirect_to reservation_path(@reservation)
  end


  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])
    @reservation.update(reservation_params)
    redirect_to reservation_path(@reservation)
  end

  def destroy
    reservation = Reservation.find(params[:id])
    reservation.destroy
    redirect_to reservations_path(reservation), notice: "予約を削除しました。"
  end


  private

  def reservation_params
    params.require(:reservation).permit(:day_of_week, :room, :time_s, :time_e, :count, :option, :number_of_option)
  end

  def reservation_search_params
    params.fetch(:search, {}).permit(:day_of_week, :room, :time_s, :time_e)
  end

end
