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
      input = gets.strip
      @api = API.new(input)
      @api.fetch
      list_movies
    end
  end
  
  def list_movies
    Movies.all.each.with_index{|m ,i| puts "#{i+1}. #{m.name}"}  
  end
  
  def menu
    input = ""
    while input != "exit"
    puts "Enter a movie's corresponding number for more details."
    puts "Enter 'list' to see the list again."
    puts "Enter 'exit' to quit the program."
    input = gets.strip.downcase
      case input
        when "20"
          puts "Minions:"
        when "19"
          puts "Iron Man 3:"
        when "list"
          list_movies
      end
    end
  end
  
  def farewell
    puts "See you next time!"
  end
end