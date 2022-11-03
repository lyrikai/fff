class GossipsController < ApplicationController

    before_action :authenticate_user, only: [:create]
    
    def index
        @gosall= Gossip.all
    end

    def show
        @gosid= Gossip.find(params[:id])
        @goscom = @gosid.comments

        if  logged_in?
        @like =  Like.find_by(gossip: params[:id], user: current_user.id)
        end
   
    end

    def new
        # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    end

    def edit
        puts params[:id]
        @gosid = Gossip.find(params[:id])
    end

    def update
        puts "1" * 100
        @gosid = Gossip.find(params[:id])
        puts @gosid.inspect
        puts "2" * 100
        post_parms = params.require(:gossip).permit(:title, :content)
        puts post_parms
        puts "3" * 100

        if @gosid.update(post_parms)
            puts "4" * 100
          redirect_to @gosid
        else
            puts "5" * 100
          render :edit
        end

    end

  
    def create
    
        @post = Gossip.new('title' => params[:title],'content' => params[:content], 'user_id' => current_user.id)
        
        if @post.save
            redirect_to root_path
        else  
            render 'new'
        end
   
    end

    def destroy
        @gosid= Gossip.find(params[:id])
        @gosid.destroy
        redirect_to root_path
    end

    private

    def authenticate_user
        unless current_user
          redirect_to new_session_path
        end
    end


end
