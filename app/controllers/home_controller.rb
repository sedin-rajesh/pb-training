class HomeController < ApplicationController
  def index
    @users = User.all.search_by_name(params[:search])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to home_path }
    end
  end
end
