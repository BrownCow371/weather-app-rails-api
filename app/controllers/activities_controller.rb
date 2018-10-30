class ActivitiesController < ApplicationController
    def index
        @activities = Activity.all
        render :json => @activities
        # render json: @activities.to_json(include: :conditions)
    end
end
