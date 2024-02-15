class CommentsController < ApplicationController
  before_action :authenticate_user, except:[:index]
  before_action :verify_comment_owner, only:[:edit,:update,:destroy]

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
    @user = current_user
    @comment = Comment.new(content:params[:content],user:@user,gossip:@gossip)
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

  private
    def verify_comment_owner
      @comment = Comment.find(params[:id])
      unless current_user == @comment.user
        flash[:danger] = "Please don't do this, you are not the gossip's author"
        redirect_to gossips_path
      end
    end

  
end
