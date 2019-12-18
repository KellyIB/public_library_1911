class Library
  attr_reader :name, :books, :authors

  def initialize(name)
    @name = name
    @books = []
    @authors = []
  end

  def add_author(author)
    @authors << author
    author.books.each do |book|
      @books << book
    end
    @books
  end

  def publication_time_frame_for(author)
    publication_time_frame = {}
    author_publication_years = author.books.map do |book|
      book.publication_year
    end.sort
    publication_time_frame[:start] = author_publication_years[0]
    publication_time_frame[:end] = author_publication_years[-1]
    publication_time_frame
  end

  def checkout(book)
    return "This book cannot be checked out because it doesn't exist in the library" if @books.include?(book) == false
      book.checked_out = true
  end

  def return (book)
      book.checked_out = false
  end






end
