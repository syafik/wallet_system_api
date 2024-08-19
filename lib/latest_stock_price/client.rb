require 'net/http'
require 'json'

module LatestStockPrice
  class Client
    BASE_URL = 'https://latest-stock-price.p.rapidapi.com'
    API_KEY = 'your api key' # Replace this with your actual RapidAPI key

    def initialize(api_key = API_KEY)
      @api_key = api_key
    end

    def price(stock_identifier)
      endpoint = "/any?Identifier=#{stock_identifier}"
      response = get_request(endpoint)
      parse_response(response)
    end

    def prices(stocks_identifier)
      identifiers = stocks_identifier.join(',')
      endpoint = "/any?Identifier=#{identifiers}"
      response = get_request(endpoint)
      parse_response(response)
    end

    def price_all
      endpoint = '/any'
      response = get_request(endpoint)
      parse_response(response)
    end

    private

    def get_request(endpoint)
      uri = URI("#{BASE_URL}#{endpoint}")
      request = Net::HTTP::Get.new(uri)
      request['X-RapidAPI-Key'] = @api_key
      request['X-RapidAPI-Host'] = URI.parse(BASE_URL).host

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.request(request)
    end

    def parse_response(response)
      case response
      when Net::HTTPSuccess
        JSON.parse(response.body)
      else
        { error: "Request failed with status #{response.code}" }
      end
    end
  end
end
