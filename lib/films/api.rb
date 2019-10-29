class API
  
  attr_accessor :year, :key 
  
  def initialize(year)
    @year = year
    @key = ENV["KEY"]
  end
  
  def fetch
    url = "https://api.themoviedb.org/3/discover/movie?api_key=#{@key}&primary_release_year=#{@year}&sort_by=revenue.desc"
    response = HTTParty.get(url)
    
    response["results"].each do |movie|
      id = movie["id"]
      name = movie["title"]
      Movies.new(name, id, @year)
    end
  end
  
  def fetch_details(movie)
    movie_id = movie.id
    url = "https://api.themoviedb.org/3/movie/#{movie_id}?api_key=#{@key}&language=en-US"
    response = HTTParty.get(url)
    overview = response["overview"]
    budget = response["budget"]
    runtime = response["runtime"]
    revenue = response["revenue"]
    movie.update(overview, runtime, revenue, budget)
  end
  
end