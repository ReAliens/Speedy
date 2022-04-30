class ItemsController < ApplicationController
  # before_action :set_item, only: %i[show edit update destroy]

  def index
    @items = Item.all
    render json: @items
  end

  def show; end

  def new
    @item = Item.new
  end

  def edit; end

  def create
    @item = Item.new(item_params)

    if @item.save
      # render json: @item
      format.json { render :show, status: :created, location: @item }
    else
      format.json { render json: @item.errors, status: :unprocessable_entity }
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        render json: @item
        format.json { render :show, status: :ok, location: @item }
      else
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :photo, :user_id, :specs)
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find
  end
end
