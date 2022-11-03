class CommentsController < ApplicationController

    before_action :authenticate_user, only: [:create]

    def index
        @comall = Comment.all
    end

    def show
        @ff= Gossip.find(params[:id])
        
    end

    def new
        # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    end

    def edit
        puts params[:id]
        @comidf= Comment.find(params[:id])
    end

    def update
        @comidf = Comment.find(params[:id])
        post_parms = params.require(:comment).permit(:content)

        if @comidf.update(post_parms)
          redirect_to gossip_path(@comidf.gossip.id)
        else
          render :edit
        end

    end

  
    def create
      
        @com = Comment.new('content' => params[:content], 'user_id' => current_user.id, 'gossip_id' => params[:gossip_id])
        puts "-" * 60
        puts @com.inspect
        
        if @com.save
            redirect_to gossip_path(:id)
        else  
            render
        end

   
    end

    def destroy
        @gosid= Comment.find(params[:id])
        @gosid.destroy
        redirect_to gossip_path(@gosid.gossip.id)
    end


    private

    def authenticate_user
        unless current_user
          redirect_to new_session_path
        end
    end
end
