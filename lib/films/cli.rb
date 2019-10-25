class CLI 
  
  attr_accessor :api 
  
  def call 
    start
  end
  
  def start
    input = ""
    unless input == 'exit' || input == Integer
      puts "Enter a year as an integer to see the best-selling films of that year."
      puts "Enter 'all' to see the best-selling films of all time."
      puts "Enter 'exit' to end the program."
      input = gets.strip.downcase
      @api = API.new(input)
      if input == 'exit'
        farewell
      elsif input == 'all'
        @api.fetch
        list_movies(input)
        menu
      elsif input.to_i.is_a?(Integer) && input.to_i >= 1850
        @api.fetch
        list_movies(input)
        menu
      else
        puts "**Please enter an input based on menu options**"
        start
      end
    end
  end
  
  def list_movies(year)
     binding.pry
    films = Movies.all.select{|movie| movie.year == year}
      films.each.with_index do |m ,i|
      sleep(0.2)
      puts "#{i+1}. #{m.name}" 
    end
  end
  
  def menu
    input = ""
    sleep(1)
      puts "Enter a movie's corresponding number for more details."
      puts "Enter 'list' to see the list again."
      puts "Enter 'year' to choose a different year."
      puts "Enter 'exit' to quit the program."
      input = gets.strip.downcase
      if input == 'exit'
        farewell
      elsif input == 'list'
        list_movies(year)
      elsif input.to_i.between?(1, 20)
        film = Movies.all[input.to_i-1]
        @api.fetch_details(film)
        display_movie(film)
      elsif input == 'year'
        start
      else
        puts "**Please enter an input based on menu options**"
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
    puts "Revenue: $#{movie.revenue}" 
    puts "--------------------------"
    sleep(1)
    puts "Budget: $#{movie.budget}" 
    puts "--------------------------"
    sleep(1)
    puts "Runtime: #{movie.runtime} minutes"
    puts "--------------------------"
    puts ""
    sleep(1)
  end
  
  # def validate(attribute)
  #   if attribute == 0 
  #     unavailable
  #   end
  # end
  
  def unavailable
    puts "No information available"
  end
  
  def farewell
    puts "See you next time!"
  end
  
end