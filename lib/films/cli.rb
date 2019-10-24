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
      list_movies
      menu
    end
  end
  
  def list_movies
    Movies.all.each.with_index do |m ,i|
      sleep(0.2)
      puts "#{i+1}. #{m.name}" 
    end
  end
  
  def menu
    input = ""
    while input != "exit"
      puts "Enter a movie's corresponding number for more details."
      puts "Enter 'list' to see the list again."
      puts "Enter 'exit' to quit the program."
      input = gets.strip.downcase
      if input == 'list'
        list_movies
      elsif input.to_i.between?(1, 20)
        film = Movies.all[input.to_i-1]
        @api.fetch_details(film)
        display_movie(film)
      end
    end
  end
  
  def display_movie(movie)
    sleep(0.2)
    puts "Movie Title: #{movie.name}"
    puts "--------------------------"
    sleep(0.4)
    puts "Synopsis: #{movie.overview}"
    puts "--------------------------"
    sleep(0.2)
    puts "Revenue: $#{movie.revenue}"
    puts "--------------------------"
    sleep(0.2)
    puts "Budget: $#{movie.budget}"
    puts "--------------------------"
    puts ""
  end
  
  def farewell
    puts "See you next time!"
  end
  
end