class SessionsController < ApplicationController
  def new

  end

  def create
    puts "$" * 60
    puts "Dans create session:"
    puts params
    puts "$" * 60
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params[:email])

    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if user && user.authenticate(params[:password])
      puts "--> J'ai trouvé l'utilisateur #{user.email}, voici son id : #{user.id}"
      puts session[:user_id]
      session[:user_id] = user.id
      puts "La sessions est : #{session}"
      redirect_to "/welcome/#{current_user.first_name}"
    else
      puts "--> Je n'ai pas trouvé l'utilisateur demandé"
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    puts session
    puts session[:user_id]
    redirect_to gossips_path

  end
end
