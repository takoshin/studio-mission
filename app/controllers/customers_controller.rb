class CustomersController < ApplicationController
  def index
    @search_params = customer_search_params
    @customers = Customer.search(@search_params)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to customer_path(@customer)
  end

  def destroy
    customer = Customer.find(params[:id])
    customer.destroy
    redirect_to customers_path(customer), notice: "アカウントを削除しました。"
  end

  private
  def customer_params
    params.require(:customer).permit(:number, :customername, :email, :profile )
  end

  def customer_search_params
    params.fetch(:search, {}).permit(:number, :customername, :email)
  end
end
