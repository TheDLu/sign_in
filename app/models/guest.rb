class Guest < ActiveRecord::Base
	has_one :visit
	has_one :resident, through: :visit
end
