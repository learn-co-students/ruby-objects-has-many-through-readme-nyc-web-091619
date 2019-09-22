require 'pry'

class Waiter
    attr_reader
    attr_accessor :name, :years_of_experience

    @@all = []

    def initialize(name, years_of_experience)
        @name = name
        @years_of_experience = years_of_experience
        @@all << self    
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end
    
    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    # def best_tipper
    #     max = 0
    #     customer = []
    #     meals.each do |meal|
    #         if meal.tip > max
    #             max = meal.tip
    #             if customer.size > 0
    #                 customer.pop
    #                 customer << meal.customer
    #             else
    #                 customer << meal.customer
    #             end
    #         else 
    #             max = max
    #         end
    #     end
    #     customer[0]
    # end

    # def best_tipper
    #     best_tipped_meal = meals.max do |meal_a, meal_b|
    #       meal_a.tip <=> meal_b.tip #don't understand this
    #     end
    #     best_tipped_meal.customer
    #   end

    def best_tipper
        largest_tipper = meals.max { |a, b| a.tip <=> b.tip }
        largest_tipper.customer
    end

    def self.all
        @@all
    end
end #end class Waiter