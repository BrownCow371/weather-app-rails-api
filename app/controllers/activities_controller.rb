class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:show, :update, :destroy]

    def index
        @activities = Activity.all
        render :json => @activities
    end

    def show
        render :json => @activity
    end

    def create
        @activity=Activity.new(activity_params)
        if @activity.save
            render :json => @activity
        else
            # render some sort of error
        end
    end

    def update
        
        if @activity.update(activity_params)
            render :json => @activity
        else
            # render some sort of error
        end

    end

    def destroy
    end

private

    def set_activity
        @activity = Activity.find_by_id(params[:id])
    end

    def activity_params
        params.require(:activity).permit(:desc, :max_temp, :min_temp, :max_wind_speed, condition_ids: [])
    end
end
