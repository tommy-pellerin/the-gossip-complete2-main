class CommentsController < ApplicationController
  def index
    puts "%"*50
    puts "Dans index comment :"
    puts params
    puts "%"*50 
    @comments = Comment.all
    @gossip = Gossip.find(params[:gossip_id])
  end

  def new    
    @comment = Comment.new
    puts "%"*50
    puts "Dans new comment :"
    puts params
    puts "%"*50    
  end

  def create
    puts "%"*50
    puts "Lorsque je soumet la création du commentaire :"
    puts params    
    puts "%"*50
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.new(content:params[:content],user:@gossip.user,gossip:@gossip)
    if @comment.save
      redirect_to @gossip
    else
      render "gossip/show", status: :unprocessable_entity
    end
  end

  def edit
    puts "%"*50
    puts "Lorsque je suis dans l'edit du commentaire :"
    puts params    
    puts "%"*50
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  def update    
    puts "%"*50
    puts "Lorsque je soumet la modofication du commentaire :"
    puts params 
    comment_params = params.require(:comment).permit(:content)
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
    puts "%"*50
    if @comment.update(content:comment_params[:content],user:@gossip.user,gossip:@gossip)
      redirect_to @gossip
    else
      render "gossip/show", status: :unprocessable_entity
    end
  end

  def destroy
    puts "%"*50
    puts "Lorsque je soumet la suppression du commentaire :"
    puts params     
    puts "%"*50
    @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    puts "le commentaire id :#{params[:id]} a été supprimé"
    redirect_to @gossip
  end


  
end
