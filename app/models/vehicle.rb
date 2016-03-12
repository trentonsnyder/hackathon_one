class Vehicle < ActiveRecord::Base
    belongs_to :user
    has_many :services, dependent: :destroy
    
    validates_presence_of :make, :model, :year
    
      def carname 
        " #{self.year} #{self.make} #{self.model}"       
      end
end
