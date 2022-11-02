class GossipsController < ApplicationController

    def new
        # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
    end

  
    def create
  
        
        puts "step 1"

        @post = Gossip.new('title' => params[:title],'content' => params[:content], 'user_id' => 1)
            

        if @post.save
            redirect_to root_path, notice: "Succes"
        else
            puts "step loose"

           
            render 'new', notice: "Sucddces"
            puts "hhhhhhhhhhhhh"
           
           
        end
   
   
    end

end
