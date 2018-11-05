class ActivitiesController < ApplicationController
    before_action :set_activity, only: [:show, :update, :destroy]
    before_action: authenticate_user, only: [:update, :create, :destroy]

    def index
        @activities = Activity.all

        if @activities
            render(
                status: 200, 
                json: @activities
            ) 
        else
            render( 
                status: 400, 
                json: {error: 'No activities found.'}
            )
        end
    end

    def show
        if @activity
            render(
                status: 200, 
                json: @activity
            ) 
        else 
            render( 
                status: 400, 
                json: {error: 'Activity not found.'}
            )
        end
    end

    def create
        @activity=Activity.new(activity_params)

        if @activity.save
            render(
                status: 200, 
                json: @activity
            ) 
        else
            render( 
                status: 400, 
                json: {error: 'Activity not able to be created.'}
            )
        end
    end

    def update
        
        if @activity.update(activity_params)
            render(
                status: 200, 
                json: @activity
            ) 
        else
            render( 
                status: 400, 
                json: {error: 'Activity not able to be updated.'}
            )
        end

    end

    def destroy
        if @activity
             render(
                 status: 200,
                 json: Activity.destroy(params[:id])
             )
        else 
            render( 
                status: 400, 
                json: {error: 'Activity not able to be deleted.'}
            )
        end

    end

private

    def set_activity
        @activity = Activity.find_by_id(params[:id])
    end

    def activity_params
        params.require(:activity).permit(:desc, :max_temp, :min_temp, :max_wind_speed, condition_ids: [])
    end
end
