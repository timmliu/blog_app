class UsersController < ApplicationController
  def index
  	@users = User.paginate(page: params[:page])
  end

  def new
  	@user = User.new
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
