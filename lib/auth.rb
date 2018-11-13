require 'jwt'

class Auth

    ALGORITHM = 'HS256'

    def self.issue(payload)
        JWT.encode(payload, ENV['AUTH_SECRET'], ALGORITHM)
    end

    def self.decode(token)
        JWT.decode(token,
        ENV['AUTH_SECRET'],
        true,
        {algorithm: ALGORITHM}).first
    end

end