class WeathersController < ApplicationController
  def index
    if params[:city] && params[:state]
      @city = 
      url = URI.decode("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22#{params[:city]}%2C%20#{params[:state]}%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
      weather = Unirest.get(url).body

      @forecast = weather["query"]["results"]["channel"]["item"]
    else 
      url = URI.decode("https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22newyork%2C%20NY%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
      weather = Unirest.get(url).body
      
      @forecast = weather["query"]["results"]["channel"]["item"]
    end
  end
end
