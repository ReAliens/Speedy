class Api::V1::UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
  end
end
