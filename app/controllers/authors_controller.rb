class AuthorsController < ApplicationController
   

    def show
        @autid= User.find(params[:id])
        @autgos = @autid.gossips
    end


    
end
