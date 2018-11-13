class SessionsController < ApplicationController

    def create
        @user = User.find_by(email: auth_params[:email])

        if @user && user.authenticate(auth_params[:password])
            @jwt = Auth.issue({user: @user.id})
            render(
                status: 200, 
                json: {jwt: @jwt}
            ) 
        else
            render( 
                status: 400, 
                json: {error: 'Incorrect email or password.'}
            )
    end

    private
    
    def auth_params
        params.require(:auth).permit(:email, :password)
    end

end