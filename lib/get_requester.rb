require 'pry' 
require 'net/http'
require 'open-uri'
require 'json'


class GetRequester

    def initialize(url)
        @url = url
    end

    def get_response_body
        uri = URI.parse(@url) #parsing our url with URI.parse 
        response = Net::HTTP.get_response(uri) #sends a get request to the url
        response.body  #returns the body of the request as JSON STRING
    end


    def parse_json
        JSON.parse(self.get_response_body) #converst JSON into ruby data structure
    end
end


URL = 'https://learn-co-curriculum.github.io/json-site-example/endpoints/people.json'
request = GetRequester.new(URL)
request.get_response_body
request.parse_json
binding.pry

