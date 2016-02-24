<<<<<<< HEAD:app/controllers/goals_controller.rb
class GoalsController < ApplicationController
   before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def new
    @goal = Goal.new
  end

  def edit
  end

  def create
    @goal = Goal.new(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'You have set a goal.' }
      else
        format.html { render :new }
      end
    end
  end

    def update
    respond_to do |format|
        if @goal.update(goal_params)
          format.html { redirect_to @goal, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }

      end
    end
  end

  def destroy
      @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'You have stopped pursuing this goal.' }
    end
  end

  private

  def set_goal
    @goal = Goal.find(params[:id])
    end

  def goal_params
    params.require(:goal).permit(:description, :user_id, :name)
  end
end
