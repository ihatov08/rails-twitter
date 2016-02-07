class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @tweets = Tweet.page(params[:page]).per(10)
    @tweet = Tweet.new
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
     if @tweet.save
      redirect_to tweets_url
      else
      render :index
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    if @tweet.update(tweet_params)
    redirect_to @tweet
  else
    render :edit
  end

  end

  def like
    tweet = Tweet.find(params[:tweet_id])
    favorite = current_user.favorites.build(tweet_id: tweet.id)
    favorite.save
    redirect_to tweets_url
  end

  def unlike
    tweet = Tweet.find(params[:tweet_id])
    favorite = current_user.favorites.find_by(tweet_id: tweet.id)
    favorite.destroy
    redirect_to tweets_url
  end

  def favoriting_users
    @tweet = Tweet.find(params[:id])
    @users = @tweet.favoriting_users
  end


  def show
    @users = User.all
    @tweet = Tweet.find(params[:id])
    @users = @tweet.favoriting_users
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_url
  end

  def reply
    tweet = current_user.tweets.build(tweet_params)
    # @tweet.reply_tweet_id = params[:id]
    if tweet.save
      redirect_to tweets_url
    else
      render :index
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(
      :user_id,
      :reply_tweet_id,
      :content,
      :tweet_id,
      )
  end
end
