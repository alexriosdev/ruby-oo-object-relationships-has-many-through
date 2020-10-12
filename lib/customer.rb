class Customer

  attr_accessor :name, :age
  @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    self.class.all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip=0)
    Meal.new(waiter, self, total, tip)
  end

  def new_meal_20_percent(waiter, total)
    tip = total * 0.2
    Meal.new(waiter, self, total, tip)
  end
  
  def meals
    Meal.all.select { |meal| meal.customer == self }
  end
  
  def waiters
    meals.map { |meal| meal.waiter }
  end

  def self.oldest_customer
    self.all.max { |customer_a, customer_b| customer_a.age <=> customer_b.age }
  end
  
end