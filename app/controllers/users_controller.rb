class UsersController < ApplicationController
  
  def home
  end


  def login
  end

  def logout
    session[:user_id] = nil
    flash[:info] = "Vous êtes maintenant déconnecté."
    redirect_to "/gossips"
  end


 def check
    @current_user = User.where(email: params[:email], password: params[:password]).first
    
    if @current_user
      session[:user_id] = @current_user.id
      flash[:info] = "Vous êtes maintenant connecté"
      redirect_to "/gossips/"

    else
      session[:user_id] = nil
      flash[:info] = "Échec de la connexion"
      redirect_to "/users/login"
    end
  end





end
