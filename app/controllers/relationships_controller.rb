class RelationshipsController < ApplicationController
  def create
  respond_to do |format|  
    @other_user=User.find(params[:follow])
     current_user.follow(@other_user)
     if Relationship.create
     flash[:success] = "#{@other_user.name}さんをフォローしました"
      format.html
      format.js  
    end
   end
  end
  
  def destroy
   respond_to do |format|  
    @user=current_user.relationships.find(params[:id]).follow
    current_user.unfollow(params[:id])
     format.html
     format.js
   end     
  end
  
end
