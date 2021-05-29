class UsersController < ApplicationController
  
 def index
   @users=User.all
   @match_user=current_user.matcher
 end
  
 def show
   @user=User.find(params[:id])
 end
  
  
end
