class Book
  attr_reader :title, :author, :publication_year
  attr_accessor :checked_out

  def initialize(book_info)
    @title = book_info[:title]
    @author_first_name = book_info[:author_first_name]
    @author_last_name = book_info[:author_last_name]
    @author = book_info[:author_first_name] + " " + book_info[:author_last_name]
    @publication_year = book_info[:publication_date].slice(-4 .. -1)
    @checked_out = false
  end
end
