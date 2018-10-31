class ConditionsController < ApplicationController
    def index
        @conditions = Condition.all
        render :json => @conditions
    end

end