class Waiter

  attr_accessor :name, :yrs_experience
  @@all = []

  def initialize(name, yrs_experience)
    @name = name
    @yrs_experience = yrs_experience
    self.class.all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip=0)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal.waiter == self }
  end

  def customers
    meals.map { |meal| meal.customer }
  end

  def best_tipper
    best_tipped_meal = meals.max { |meal_a, meal_b| meal_a.tip <=> meal_b.tip }
    best_tipped_meal.customer
  end

  def worst_tipper
    worst_tipped_meal = meals.min { |meal_a, meal_b| meal_a.tip <=> meal_b.tip }
    worst_tipped_meal.customer
  end

  def most_frequent_customer
    customers.uniq.max_by { |meal| customers.count(meal) }
  end

  def average_tips
    tips = meals.map { |meal| meal.tip }
    tips.sum / tips.count
  end

  def self.most_yrs_experience_waiter
    self.all.max_by { |waiter| waiter.yrs_experience}
  end

  def self.most_yrs_experience_tips
    waiter = self.most_yrs_experience_waiter
    waiter.average_tips
  end

  def self.least_yrs_experience_waiter
    self.all.min_by { |waiter| waiter.yrs_experience}
  end

  def self.least_yrs_experience_tips
    waiter = self.least_yrs_experience_waiter
    waiter.average_tips
  end

end