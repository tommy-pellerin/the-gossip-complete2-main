class GossipsController < ApplicationController
    def index
      puts "$" * 60
      puts "Voici le param de la page welcome :"
      puts  params[:first_name]
      puts "$" * 60    
      @first_name = params[:first_name]
      @gossips = Gossip.all
      
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
      @user = User.find(11)
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
end
