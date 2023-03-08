class SessionsController < ApplicationController
  def new
  end

  def create
    #check if user exists
    @user = User.find_by({"email"=>params["email"]})
    if @User
    #if they do, check that they know password
      #if params["password"] == @user["password"]
    if BCrypt::Password.new(@user["password"]) == params["password"]
    #if they do, send them in
        redirect_to "/places"
      else
        redirect_to "/"
      end 
    else 
      redirect_to "/"
    end

  end

  def destroy
  end
end
  