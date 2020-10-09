class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    # yutaka@email.com != Yutaka@email.com -> yutaka@mail.com == yutaka@email.com
    if user && user.authenticate(params[:session][:password])
      log_in user #log_in -> user/session helper method
      redirect_to user 
    else
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
