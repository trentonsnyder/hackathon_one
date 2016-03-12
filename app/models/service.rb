class Service < ActiveRecord::Base
  belongs_to :vehicle
  validates_presence_of :name
end
