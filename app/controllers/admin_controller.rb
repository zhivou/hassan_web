class AdminController < ApplicationController
  def index
  end

  def jobs
    @generators = Generator.all.paginate(page: params[:page], per_page: 15)
  end

  def show_users
    @users = User.all.paginate(page: params[:page], per_page: 15)
  end

  def show_mechanical_props
    @mechanical_props = MechanicalProp.all.paginate(page: params[:page], per_page: 15)
  end
end
