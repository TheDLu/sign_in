class Resident < ActiveRecord::Base
	belongs_to :residence
	has_many :guests, through: :visits
end
