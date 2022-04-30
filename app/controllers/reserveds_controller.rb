class ReservedsController < ApplicationController
  def index
    @reserveds = Reserved.all
    render json: @reserveds
  end

  def show
    @reserved = Reserved.find(params[:id])
    render json: @reserved
  end

  def new
    @reserved = Reserved.new
  end

  def edit
    @reserved = Reserved.find(params[:id])
  end

  def create
    @reserved = Reserved.new(reserved_params)
    if @reserved.save
      render json: @reserved
    else
      render json: @reserved.errors, status: :unprocessable_entity
    end
  end

  def update
    @reserved = Reserved.find(params[:id])
    if @reserved.update(reserved_params)
      render json: @reserved
      format.json { render :show, status: :ok, location: @reserved }
    else
      render json: @reserved.errors, status: :unprocessable_entity
    end
  end

  def destroy 
    @reserved = Reserved.find(params[:id])
    if @reserved.destroy
      respond_to do |format|
        format.json { head :no_content }
      end
    end
  end

  private

  def reserved_params
    params.require(:reserved).permit(:name, :city, :started_at, :ended_at, :user_id, :item_id)
  end
end
