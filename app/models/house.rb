class House < ActiveRecord::Base
	belongs_to :user
	has_many   :pictures, dependent: :destroy
	
	validates :user_id, presence: true
	validates :description, presence: true, length: {maximum: 200}
	validates :country, presence: true
	validates :address, presence: true
	validates :city, presence: true
	validates :price, presence: true

	geocoded_by :full_address
	after_validation :geocode

	acts_as_commentable
	self.per_page = 5

	def full_address
		"#{address}, #{city}, #{country}"
	end


end
