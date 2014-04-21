class Residence < ActiveRecord::Base
	belongs_to :user
	has_many :residents
end
