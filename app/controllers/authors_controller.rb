class AuthorsController < ApplicationController
   

    def show
        @autid= User.find(params[:id])
        @autgos = @autid.gossips
    end

    
    def create

        @post = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], description: params[:description], age: params[:age], city_id: params[:city_id], password: params[:password])        
     
        if @post.save
            redirect_to root_path
        else  
            render 'new'
        end
   
    end


    
end
