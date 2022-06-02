class MainsController < ApplicationController
  def welcome
    client = OpenStreetMap::Client.new
    lattitude = params[:lattitude]
    longitude = params[:longitude]
    @res = {}
    if [lattitude, longitude].all?{|e| e.present? }
      @res = client.reverse(format: 'json', lat: lattitude, lon: longitude)
      puts @res
      Place.create_place(@res)
    end
    respond_to do |format|
      format.html { render :welcome }
      format.js { render :welcome1 }
    end
  end
end
