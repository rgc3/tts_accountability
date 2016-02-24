class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  
   def index
    @goals = Goal.all
  end

  def show
    
  end

  def new
    @goal = Goal.new
  end

  def edit
  end

  def create
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save
        # format.html { redirect_to @tweet, notice: 'You have successfully wasted your life.' }
        format.html { redirect_to root_path, notice: 'You set a new goal. Good for you' }
      else
        format.html { render :new }
      end
    end
  end

    def update
    respond_to do |format|
        if @goal.update(tweet_params)
          format.html { redirect_to @tweet, notice: 'You have modified your goal.' }
      else
        format.html { render :edit }

        end
    end
    end

  def destroy
      @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Your tweet is in the garbage where it belongs.' }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:message, :user_id, :avatar)
  end
end

