class SalesController < ApplicationController
  before_action :set_order, only: [:edit, :update]
  
  def new
  	@order = Order.new :user_id=>@current_user.id
  	@order.save
  	@order.customer = Customer.new
  end

  def create
  end

  def edit
  end

  def update
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = User.find(params[:id])
    end
end
