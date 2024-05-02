class NewsController < ApplicationController
  def index
    @title = "News"
    
    #require 'uri'
    #require 'net/https'

    #uri = URI("https://graph.facebook.com/v19.0/me?fields=id%2Cname%2Cfeed.limit(1)%7Battachments%7Bdescription%2Curl%7D%7D&access_token=EAAUiiMmT8EQBO4PEFvlAtZBBoL8oqDIxQj8SDNUmLDGHjsEZAyLxSg23vrW16lTZAVDq280ERd1ZBaLZBxZCCjLTwjghOHxAZBRpIGegaTwcmCQd5SXK6XMlCojJrU88FCo77RVzr1fMlhyDUGX0jOaaTKFLJWcXB3YjysqIx3ScH5e6XAhZAM8lu6vqcUv7OdIZCC6HGXLpZARGpxs1AtR1LxPABnb05Yjp4L")
    #res = Net::HTTP.get_response(uri)

    require 'httparty'

    response = HTTParty.get(
      "https://graph.facebook.com/v19.0/me?fields=id%2Cname%2Cfeed.limit(1)%7Bmessage%2Cpermalink_url%2Cis_published%2Ccreated_time%7D&access_token=EAAUiiMmT8EQBO8mTBtpQnyu6k42fipTmqsEi8gkkGshZAuxZBeNSjqX9DPBSPnGpUBvvfkGOfoOG3mlIr2TAdywJHrbqUq6gKD6ZAXtYMQFZADzlwW2SbfwzldNlZAYwZAr1qWlF5Fz5HhZC1VIgWqlGyVNWHdxj9FYFPMrhMlFCivmHR7sU0N6QasunlStI7KG8B3aKRVq")
    json_string = response.body if response.code == 200
    if response.code == 200
      json_string = response.body
      json_object = JSON.parse(json_string)
      @facebook = json_object['feed']['data'][0]
    else
      json_string = response.body
      json_object = JSON.parse(json_string)
      @error = json_object['error']['message']
    end


    #EAAUiiMmT8EQBO4PEFvlAtZBBoL8oqDIxQj8SDNUmLDGHjsEZAyLxSg23vrW16lTZAVDq280ERd1ZBaLZBxZCCjLTwjghOHxAZBRpIGegaTwcmCQd5SXK6XMlCojJrU88FCo77RVzr1fMlhyDUGX0jOaaTKFLJWcXB3YjysqIx3ScH5e6XAhZAM8lu6vqcUv7OdIZCC6HGXLpZARGpxs1AtR1LxPABnb05Yjp4L
    # puts response.body if response.code == 200
    # @facebook = response.body if response.code == 200
    #require 'json'
    #json_string = response.body if response.code == 200
    #json_object = JSON.parse(json_string)
    #@facebook = json_object['feed']['data'][0]['attachments']['data'][0]
  end
end
