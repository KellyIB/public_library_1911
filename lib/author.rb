class Author
  attr_reader :name, :books

  def initialize(author_info)
    @first_name = author_info[:first_name]
    @last_name = author_info[:last_name]
    @name = author_info[:first_name] + " " + author_info[:last_name]
    @books = []
  end

  def write(title, date)
    book_info = {}
    book_info[:author_first_name] = @first_name
    book_info[:author_last_name] = @last_name
    book_info[:title] = title
    book_info[:publication_date] = date
     x = Book.new(book_info)
     books << x
     x
  end








  end
