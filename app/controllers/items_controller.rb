class ItemsController < ApplicationController
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

  def edit; end

  def create
    @item = Item.new(item_params)

    if @item.save
      format.json { render :show, status: :created, location: @item }
    else
      format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      render json: @item
      format.json { render :show, status: :ok, location: @item }
    else
      format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @item = Item.find(params[:id])
    if @item.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :photo, :user_id, :specs)
  end
end
