class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    before_action :authenticate, only: [:update, :destroy]

    def create
        @user=User.new(user_params)

        if @user.save
            @jwt = Auth.issue({user: @user.id})
            render(
                status: 200, 
                json: {
                    jwt: @jwt, 
                    user: @user.name}
            ) 
        else
            render( 
                status: 400, 
                json: user_errors
            )
        end
    end

    def update
        if @user.update(user_params)
            render(
                status: 200, 
                json: @user
            ) 
        else
            render( 
                status: 400, 
                json: user_errors
            )
        end
    end

    def show
        if @user
            render(
                status: 200,
                json: @user
            )
       else 
           render( 
               status: 400, 
               json: {error: 'User account not found.'}
           )
       end
    end

    def destroy
        if @user
            render(
                status: 200,
                json: User.destroy(params[:id])
            )
       else 
           render( 
               status: 400, 
               json: {error: 'User account not able to be deleted.'}
           )
       end
    end

    private

    def set_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end

    def user_errors
        json_error = {"error": []}

        if @user.errors.any?
            @user.errors.full_messages.each do |msg|
                json_error[:error] << msg
            end
        end
        json_error    
    end
end