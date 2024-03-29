class UsersController < ApplicationController

	def index
        @users = User.all
    end

    def new
        @user = User.new
    end
        
    def create
        @user = User.new(user_params)
       if @user.save
        	redirect_to @user
        else 
           render 'new'
        end  
    end
	 
    def show
		
	#	unless params[:id] == ("sign_up" or "log_in" or "sign_in")

			if params[:format]
				@user = User.find(params[:format])
			else
				@user = User.find(params[:id])
			end
	#	end
    end
    
    def edit
        @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
      end
    end
    
    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to @user
          
     end
    
	#dorothy Lake
	
    #************Voting
	def upvote
		@user = User.find(params[:format])
		@user.upvote_by current_user
		redirect_to @user
	end
	
	def downvote
	  @user = User.find(params[:format])
	  @user.downvote_by current_user
	  redirect_to @user
	end
	
    
    private
      def user_params
        params.require(:user).permit(:email, :created_at)
      end
	
end
