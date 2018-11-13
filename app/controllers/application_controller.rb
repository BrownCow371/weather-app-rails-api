class ApplicationController < ActionController::API
    # Prevent CSRF attacks by raising an exception.
    # Per FullStackReact - For APIs, you may want to use :null_session instead.
    # protect_from_forgery with: :exception
    # protect_from_forgery with: :null_session
    def logged_in?
        !!current_user
    end

    def authenticate
        render( 
                status: 400, 
                json: {error: 'You are unauthroized to perform this action. Please login.'}
            ) unless logged_in?
    end

    def current_user
        if auth_present?
            user = User.find(auth["user"])
            if user
                @current_user ||= user
            end
        end

    end

    private
        def token
            request.env["HTTP_AUTHORIZATION"].scan(/Bearer (.*)$/).flatten.last
        end

        def auth
            Auth.decode(token)
        end

        def auth_present?
            !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
        end
end
