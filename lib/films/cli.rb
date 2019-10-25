class CLI 
  
  attr_accessor :api 
  
  def call 
    start
    # @api = API.new(2018)
    # @api.fetch
    # movie = Movies.all.first
    # @api.fetch_details(movie)
  end
  
  def start
    input = ""
    unless input == 'exit' || input == Integer
      puts "Enter a year as an integer to see the best-selling films of that year."
      puts "Enter 'all' to see the best-selling films of all time."
      puts "Enter 'exit' to end the program."
      input = gets.strip.downcase
      @api = API.new(input)
      @api.fetch
      list_movies(input)
      menu
    end
  end
  
  def list_movies(year)
    films = Movies.all.select{|movie| movie.year == year}
      films.each.with_index do |m ,i|
      sleep(0.2)
      puts "#{i+1}. #{m.name}" 
    end
  end
  
  def menu
    input = ""
    while input != "exit"
      puts "Enter a movie's corresponding number for more details."
      puts "Enter 'list' to see the list again."
      puts "Enter 'year' to choose a different year."
      puts "Enter 'exit' to quit the program."
      input = gets.strip.downcase
      if input == 'list'
        list_movies(year)
      elsif input.to_i.between?(1, 20)
        film = Movies.all[input.to_i-1]
        @api.fetch_details(film)
        display_movie(film)
      elsif input == 'year'
        start
      end
    end
  end
  
  def display_movie(movie)
    sleep(1)
    puts "Movie Title: #{movie.name}"
    puts "--------------------------"
    sleep(1)
    puts "Synopsis: #{movie.overview}"
    puts "--------------------------"
    sleep(1)
    puts "Revenue: $#{movie.revenue}" if movie.revenue != 0
    puts "--------------------------"
    sleep(1)
    puts "Budget: $#{movie.budget}" if movie.budget != 0
    puts "--------------------------"
    sleep(1)
    puts "Runtime: #{movie.runtime} minutes"
    puts "--------------------------"
    puts ""
    sleep(0.5)
  end
  
  def unavailable
    puts "Sorry, this movie doesn't have this information."
  end
  
  def farewell
    puts "See you next time!"
  end
  
end