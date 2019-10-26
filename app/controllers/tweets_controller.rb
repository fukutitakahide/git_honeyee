class TweetsController < ApplicationController
    
    before_action :to_index, except: :index
    
    def index
        @tweet = Tweet.includes(:user).page(params[:page]).per(5).order("id DESC")
    end
    
    def new
    end
    
    def create
        Tweet.create(image: tweet_params[:image],text: tweet_params[:text],user_id: current_user.id)
    end
    
    def show
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        if tweet.user_id == current_user.id
            tweet.destroy
        end
    end
    
    def edit
        @twee = Tweet.find(params[:id])    
    end
    
    def update
        tweet = Tweet.find(params[:id])
        if tweet.user_id == current_user.id
            tweet.update(tweet_params)
        end
    end
        
    private
    
    def tweet_params
        params.permit(:text,:image)
    end
    
    def to_index
        redirect_to action: :index  unless user_signed_in?
    end
end
