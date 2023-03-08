class SessionsController < ApplicationController
  def new
  end

  def create
    #check if user exists
    @user = User.find_by({"email"=>params["email"]})
    if @user
   
    if BCrypt::Password.new(@user["password"]) == params["password"]
      session["user_id"] = @user["id"]
      flash["notice"] = "Welcome!"
      redirect_to "/places"
      else
        flash["notice"] = "Sorry, that password is wrong."
        redirect_to "/sessions/new"
      end 
    else 
      flash["notice"] = "That username does not exist."
      redirect_to "/sessions/new"
    end

  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye!"
    redirect_to "/sessions/new"
  end
end
  