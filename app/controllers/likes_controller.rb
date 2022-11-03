class LikesController < ApplicationController



    def show
   
        
    end

    def new
        # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    end

  
    def create
      
        @like = Like.new('user_id' => current_user.id, 'gossip_id' => params[:gossip_id])
        a = params[:gossip_id]
        puts "/" *60
        puts @like.inspect
        
        if @like.save
            if params[:gossip_id] != nil
    
                b = params[:gossip_id]
          
                redirect_to city_path(b)
             else 
                 a = params[:id]
             redirect_to gossip_path(a)
             end
        else  
            redirect_to  gossip_path(a)
        end

    end

    def destroy

        if params[:gossip_id] != nil
           @like = Like.find_by('user_id' => current_user.id, 'gossip_id' => params[:gossip_id])
           b = params[:gossip_id]
           @like.destroy
           redirect_to city_path(b)
        else 
            @like = Like.find_by(gossip: params[:id], user: current_user.id)
            a = params[:id]
            @like.destroy
        redirect_to gossip_path(a)
        end
      
    end

end
