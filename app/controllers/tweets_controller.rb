class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @tweets = Tweet.page(params[:page])
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

  def show
    @users = User.all
    @tweets = Tweet.all
    @tweet = Tweet.find(params[:id])
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_url
  end

  private

  def tweet_params
    params.require(:tweet).permit(
      :user_id,
      :reply_tweet_id,
      :content
      )
  end
end
