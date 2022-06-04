class MainsController < ApplicationController
  def welcome
    client = OpenStreetMap::Client.new
    lattitude = params[:lattitude]
    longitude = params[:longitude]
    @res = {}
    if [lattitude, longitude].all?{|e| e.present? }
      @res = client.reverse(format: 'json', lat: lattitude, lon: longitude)
      Place.create_place(@res)
    end
    respond_to do |format|
      format.html { render :welcome }
      format.js { render :welcome1 }
    end
  end

  def text_search
    @places = Place.all.collect(&:display_name)
    if params[:search].present?
     @place = Place.find_by(display_name: params[:search])
    else
      @place = Place.first
    end
  end
end
