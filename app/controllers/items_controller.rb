class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:edit, :update, :show, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    if @item.user_id != current_user.id || @item.user_purchase != nil
      redirect_to root_path
    else current_user.id == @item.user_id
      render :edit
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path      
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      @item.destroy
      redirect_to root_path
    end   
  end

  private

  def item_params
    params.require(:item).permit(
      :image, :item_name, :item_explanation, :item_category_id, :item_condition_id, :delivery_fee_id, :delivery_area_id, :delivery_date_id, :price, :tag_name
    ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
