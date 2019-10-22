class API
  
  def fetch
    key = "f505bdb20065676b1b3df3d3f10be23a"
    url = "https://api.themoviedb.org/3/discover/movie?api_key=#{key}&primary_release_year=2019&sort_by=revenue.desc"
    response = HTTParty.get(url)
    binding.pry
  end
  
end

