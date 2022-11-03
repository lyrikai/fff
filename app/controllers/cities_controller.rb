class CitiesController < ApplicationController

    
    def show
        @cityid= City.find(params[:id])
        @citygos = @cityid.users

        @citygos.each do |i|
            k = i.gossips

            k.each do |j|
               puts j.title
            end

           
      
        end

        if  logged_in?
            @like =  Like.find_by(gossip: params[:id], user: current_user.id)
        end

        
    end

end
