class Movies
  attr_accessor :name, :id, :year, :overview, :runtime, :revenue, :budget
  
  @@all = []
  
  def initialize(name, id)
    @name = name 
    @id = id 
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def update(overview, runtime, revenue, budget)
    self.overview = overview
    self.runtime = runtime
    self.revenue = revenue
    self.budget = budget
  end
  
 end