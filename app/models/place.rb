class Place < ApplicationRecord

	def self.create_place place_data
		Place.create!(
			lat: place_data["lat"], 
			long: place_data["lon"], 
			display_name: place_data["display_name"], 
			address_place: place_data["address"]["place"], 
			house_no: place_data["address"]["house_number"], 
			road: place_data["address"]["road"], 
			suburb: place_data["address"]["suburb"], 
			city: place_data["address"]["city"], 
			county: place_data["address"]["county"], 
			state: place_data["address"]["state"], 
			postcode: place_data["address"]["postcode"], 
			country: place_data["address"]["country"], 
			country_code: place_data["address"]["country_code"], 
			boundingbox: place_data["boundingbox"]
		) 
	end	
end

