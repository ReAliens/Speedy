class ItemController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(set_item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item_params
    params.require(:item).permit(:name, :description, :price, :image)
  end
end
