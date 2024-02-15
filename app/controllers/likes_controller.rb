class LikesController < ApplicationController
  
  def index

  end

  def new
    puts "$" * 60
    puts "lorsque'on rentre dans la page new like :"
    puts params
    puts "$" * 60
    
  end

  def create
    puts "$" * 60
    puts "lorsque'on veux créer un like :"
    puts params
    puts "$" * 60
    @gossip = Gossip.find(params[:format])    
    @like = Like.new(user:current_user,gossip:@gossip)      
    if @like.save
      flash[:success] = "ton like a été ajouté"
      redirect_to @gossip
    else
      render 'gossip/show'
    end
  end

  def destroy
    puts "$" * 60
    puts "lorsque'on veux supprimer un like :"
    puts params
    puts "$" * 60    
    @like = Like.find(params[:id])
    @gossip = @like.gossip
    if @like.destroy
      flash[:danger] = "ton like a été supprimé"
      redirect_to @gossip
    end
  end
end
