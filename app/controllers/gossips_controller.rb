class GossipsController < ApplicationController
  before_action :authenticate_user, except:[:index,:show]
  before_action :verify_gossip_owner, only:[:edit,:update,:destroy]

    def index
      puts "$" * 60
      puts "Voici le param de la page welcome :"
      puts  params[:first_name]
      puts "$" * 60    
      @first_name = params[:first_name]
      @gossips = Gossip.all
      puts "Voici la sessions et l'user.id encours dans la page welcome :"
      puts  session.inspect #affiche un object action que la session soit créé ou pas, et cela change à chaque réfraichissement de la page, l'object n'est donc connecté à rien #<ActionDispatch::Request::Session:0x00007fb3e1c1f150> et lorsque'on fait un inspect #<ActionDispatch::Request::Session:0x12458 not yet loaded>
      puts  session.id # affichier l'id de l'objet, celui ci ne change jamais que l'utilisateur soit connecté ou pas : f5eb0f6a2b3457b5a4d6dc2a7df6b0be
      puts  session[:user_id] #ceci est nil si l'utilisateur est pas connecté, c'et à dire que la session n'est pas créée 
      puts "$" * 60 
    end

    def show
        puts "$" * 60
        puts "Voici le params de la page gossip show :"
        puts  params[:id]
        puts "$" * 60    
        @id = params[:id]
        @gossip = Gossip.find(@id)

        #Partie commentaire
        @comments = Comment.all
    end
    
    def edit
      @id = params[:id]
      @gossip = Gossip.find(@id)
    end


    def update
      @gossip = Gossip.find(params[:id])
      puts "%"*10
      puts params      
      gossip_params = params.require(:gossip).permit(:title,:content)
      puts "%"*10
      if @gossip.update(title:gossip_params[:title],content:gossip_params[:content],user:@gossip.user)
        flash[:success] = "Le gossip a été mise à jour correctement."
        redirect_to @gossip
      else
        render :edit
      end
    end

    def new
      @gossip = Gossip.find(1)
      puts "$" * 60
      puts "Dans new :"
      puts params
      puts "$" * 60
    end

    def create      
      @user = current_user
      puts "$" * 60
      puts "Lorsque je soumet le formulaire avec create :"
      puts params
      puts params[:title]
      puts params[:content]      
      puts "$" * 60
      @gossip = Gossip.new(title:params[:title],content:params[:content],user:@user)
      
      if @gossip.save
        flash[:success] = "Le gossip a été créé correctement."
        redirect_to gossips_path
      else
        render 'gossips/new'
      end
    end

    def destroy
      @gossip = Gossip.find(params[:id])
      @gossip.destroy
      puts "%"*50
      puts "Le gossips #{@gossip.id} a été supprimé"
      puts "%"*50

      redirect_to gossips_path
    end

    private
    def verify_gossip_owner
      @gossip = Gossip.find(params[:id])
      unless current_user == @gossip.user
        flash[:danger] = "Please don't do this, you are not the gossip's author"
        redirect_to gossips_path
      end
    end

end
