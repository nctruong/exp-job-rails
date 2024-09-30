module JwtHelper
  require 'jwt'

  SECRET_KEY = ENV['JWT_SECRET_KEY'] || 'willnguyen'

  def self.encode(payload, exp = 24.hours.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]
    HashWithIndifferentAccess.new(decoded)
  rescue JWT::DecodeError => e
    raise "Invalid token"
  end
end