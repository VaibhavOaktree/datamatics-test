class Api::V1::GeoJsonController < ApplicationController
  def geojson
    client = OpenStreetMap::Client.new
    lattitude = params[:lattitude]
    longitude = params[:longitude]
    @geojson = {
      "type": "FeatureCollection",
      "features": [
        {
          "type": "Feature",
          "properties": { 
            "name": [],
            "address": []
          },
          "geometry": {
            "type": "Point",
            "coordinates": []
          }
        }
      ]
    }
    if [lattitude, longitude].all?{|e| e.present? }
      @res = client.reverse(format: 'json', lat: lattitude, lon: longitude)
      @geojson[:features][0][:geometry][:coordinates].push @res["lat"]
      @geojson[:features][0][:geometry][:coordinates].push @res["lon"]
      @geojson[:features][0][:properties][:name].push @res["display_name"]
      @geojson[:features][0][:properties][:address].push @res["address"]["road"]
      @geojson[:features][0][:properties][:address].push @res["address"]["city"]
      @geojson[:features][0][:properties][:address].push @res["address"]["county"]
      @geojson[:features][0][:properties][:address].push @res["address"]["state"]
    end
    respond_to do |format|
      format.json { render json: @geojson }
    end
  end
end