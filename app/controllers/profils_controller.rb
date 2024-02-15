class ProfilsController < ApplicationController
  def index

  end
  def show
    @id = params[:id]
    @gossip = Gossip.find(params[:id])
    puts "%"*60    
    puts params
    puts "%"*60
  end
  def new    
    @user = User.find(1)
    puts "$" * 60
    puts "Dans new profil:"
    puts params
    puts "$" * 60
  end

  def create    
    puts "$" * 60
    puts "Lorsque je soumet le formulaire de creation de profil avec create :"
    puts params 
    puts "$" * 60
    @city = City.find(1)
    @user = User.new(first_name:params[:first_name],last_name:params[:last_name],description:params[:description],email:params[:email],age:params[:age],city:@city,password:params[:password])
    if @user.save
      flash[:success] = "Le profil a été créé correctement. Veuillez vous connecter"
      redirect_to new_session_path
    else
      render 'profils/new'
    end
  end
end
