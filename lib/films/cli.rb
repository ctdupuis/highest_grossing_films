class CLI 
  
  attr_accessor :api 
  
  def call 
    list_movies
    menu
    farewell
    @api = API.new(2018)
    @api.fetch
    movie = Movies.all.first
    @api.fetch_details(movie)
  end
  
  def list_movies
    puts "Here are the 20 highest grossing movies of all time:"
    puts "20. Minions"
    puts "19. Iron Man 3"
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