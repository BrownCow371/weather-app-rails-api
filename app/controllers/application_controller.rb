# class ApplicationController < ActionController::Base
class ApplicationController < ActionController::API
    # Prevent CSRF attacks by raising an exception.
    # Per FullStackReact - For APIs, you may want to use :null_session instead.
    # protect_from_forgery with: :exception
    # protect_from_forgery with: :null_session
    
#  user authentication
    include Knock::Authenticable

end
