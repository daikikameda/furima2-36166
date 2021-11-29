class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :new]


  def index
    @buy_form = BuyForm.new
    if @item.user_id == current_user.id || @item.user_purchase != nil
      redirect_to root_path
    end
  end

  def new
    @buy_form = BuyForm.new
  end  

  def create
    @buy_form = BuyForm.new(set_params)
    if @buy_form.valid?
      pay_item
      @buy_form.save
      redirect_to root_path
    else
      render action: :index
    end
    
  end

  private
  
  def set_params
    params.require(:buy_form).permit(:post_code, :delivery_area_id, :city, :building, :phone_number, :addressline).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyform_params[:token],
      currency: 'jpy'
    )
  end

  def buyform_params
    params.permit(:token)
  end

  def set_item
    @item = Item.find(params[:item_id])
  end
end
