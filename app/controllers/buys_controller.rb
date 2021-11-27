class BuysController < ApplicationController
  before_action :authenticate_user!


  def index
    @item = Item.find(params[:item_id])
    @buy_form = BuyForm.new
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def new
    @buy_form = BuyForm.new
    @item = Item.find(params[:item_id])
  end  

  def create
    @item = Item.find(params[:item_id])
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
    Payjp.api_key = "sk_test_993d988113ccdc025ddbd135"
    Payjp::Charge.create(
      amount: @item.price,
      card: buyform_params[:token],
      currency: 'jpy'
    )
  end

  def buyform_params
    params.permit(:token)
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to new_user_session_path unless user_signed_in?
  end
end
