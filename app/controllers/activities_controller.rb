class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:show, :update, :destroy]

    def index
        @activities = Activity.all
        render :json => @activities
        # render json: @activities.to_json(include: :conditions)
    end

    def show
        render :json => @activity
    end

    def create
        @activity=Activity.new(activity_params)
        if @activity.save
            render :json => @activity
        else
            # render...what?
        end
    end

    def update
    end

    def destroy
    end

private

    def set_activity
        @activity = Activity.find_by_id(params[:id])
    end

    def activity_params
        # need to add conditions. get this working first.
        params.require(:activity).permit(:desc, :max_temp, :min_temp, :max_wind_speed)
    end
end
