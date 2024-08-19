require 'base64'
require 'json'

class TokenEncoderDecoder
  SECRET_KEY = 'MY_SECRET_KEY'.freeze
  def self.encode(payload)
    Base64.encode64(payload.to_json + SECRET_KEY).strip
  end

  def self.decode(token)
    decoded_token = Base64.decode64(token)
    payload_json = decoded_token.chomp(SECRET_KEY)
    payload = JSON.parse(payload_json)
    payload&.dig('user_id')

  rescue JSON::ParserError
    nil
  end
end
