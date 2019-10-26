class UsersController < ApplicationController
    
    
    
    def show
        @nickname = current_user.nickname
        @tweet = current_user.tweets.page(params[:page]).per(5).order("created_at DESC")
        @tweets = Tweet.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")

    end
end
