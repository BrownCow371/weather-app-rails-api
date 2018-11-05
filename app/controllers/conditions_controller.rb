class ConditionsController < ApplicationController
    def index
        @conditions = Condition.all
        if @conditions
            render(
                status: 200, 
                json: @conditions
            ) 
        else
            render( 
                status: 400, 
                json: {error: 'No weather conditions found.'}
            )
        end
    end

end