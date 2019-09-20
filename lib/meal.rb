class Meal
    #````ruby
    attr_accessor :waiter, :customer, :total, :tip
 
    @@all = []
   
    def initialize(waiter, customer, total, tip=0)
      @waiter = waiter
      @customer = customer
      @total = total
      @tip = tip
      @@all << self
    end
   
    def self.all
      @@all
    end
    #````

    def change_was_made
      "learn submit next time; learn stops submitting if not"
    end

end