require 'pry'
class Waiter

    attr_accessor :name, :years_experience

    @@all = []

    def initialize(name, years_experience)
        @name = name
        @years_experience = years_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
    end

    def best_tipper
        # We want the customer who gave this waiter the largest tip
        largest_tip = self.meals.max_by do |meal|
            meal.tip
            # binding.pry
        end
        largest_tip.customer
    end
end