class Api::V1::ItemsController < ApplicationController
  def index
    @items = Item.all
    render json: @items
  end

  def show
    @item = Item.find(params[:id])
    render json: @item
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      render json: { success: 'Success', message: 'item Added Successfully', data: @item, status: :created }
    else
      format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      render json: { success: 'Success', message: 'item deleted Successfully', data: @item, status: :deleted }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :photo, :user_id, :specs)
  end
end
