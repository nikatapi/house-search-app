class Search < ActiveRecord::Base
	validates :country, presence: true


	geocoded_by :full_address
	after_validation :geocode

	def full_address
		"#{address}, #{city}, #{country}"
	end

	def found_houses
		@found_houses ||= find_houses
	end

private

	def find_houses
		found_houses = House.where(country: country)
		found_houses = found_houses.where("city like ?", "%#{city}") if city.present?
		found_houses = found_houses.where("price <= ?", max_price) if max_price.present?

		#this is not so accurate using SQLite DB
		found_houses = found_houses.near([latitude, longitude], max_radius, :units => :km) if max_radius.present?
		
		
		#here we'll calculate the ssq and return the results
		found_houses
	end

end
