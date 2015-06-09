class SessionsController < ApplicationController
  def new
  end

  def create
    #this is where authentication happens
    @user = User.where(username: params[:username]).first
    if @user.present? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = 'YAY! welcome to the site'
       redirect_to root_path
    else
      flash[:alert] = 'Oops You entered in the wrong information'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
