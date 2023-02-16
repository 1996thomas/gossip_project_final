class SessionsController < ApplicationController
  
  def create 
    puts "%" *60
    puts params
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/sessions/profile"
    else
      render 'new'
    end
  end
  def destroy
    session.delete(:user_id) 
    redirect_to "/sessions/new"
  end
end
