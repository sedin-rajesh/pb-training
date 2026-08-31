class HomeController < ApplicationController
  def index
    @users = User.includes(:vendor).search_by_name(params[:search])
    case params[:sort]
    when "user_name"
      @users=@users.order(user_name: sort_direction)
    when "email"
      @users=@users.order(email: sort_direction)
    when "vendor_name"
      @users=@users.joins(:vendor).order(vendors: { name: sort_direction })
    end
    @users=@users.page(params[:page]).per(3)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to home_path }
    end
  end

  private
  def sort_direction
    params[:direction]=="desc"? :desc: :asc
  end
end
