module SessionsHelper
  def current_user #permet d'identifier l'utilisateur actuel
    User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def logged_in? #Cette méthode te retourneraittruesisession[:user_id]est non-nil etfalse` dans le cas contraire
    if session[:user_id] != nil
      true
    else
      false
    end
  end

  # def current_user_like #permet d'identifier le like de l'utilisateur actuel
  #   Like.find_by(user:current_user,gossip:current_gossip)
  # end

  private
    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end
end
