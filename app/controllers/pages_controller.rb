class PagesController < ApplicationController
    def home
        @gossip = Gossip.all
        @tes = params[:id]
    end

    def contact

    end

    def team

    end

    def welcome
 
    end

    def potin
 
    end

    def author
        @author = User.all
        @ok = params[:id].to_i 
        @gostab =  @author[@ok.to_i].gossips
    end
end
