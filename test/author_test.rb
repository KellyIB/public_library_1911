require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'

class AuthorTest <Minitest::Test

  def setup
    @book = Book.new({author_first_name: "Harper", author_last_name: "Lee",
        title: "To Kill a Mockingbird", publication_date: "July 11, 1960"})
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
  end

  def test_it_exists
    assert_instance_of Author, @charlotte_bronte
  end

  def test_it_attributes
    assert_equal "Charlotte Bronte", @charlotte_bronte.name
    assert_equal [], @charlotte_bronte.books
  end

  def test_it_starts_with_no_books_can_create_and_adds_books_by_write
    assert_equal [], @charlotte_bronte.books
      jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    assert_equal Book, jane_eyre.class
    assert_equal "Jane Eyre", jane_eyre.title
    assert_equal [jane_eyre], @charlotte_bronte.books
      villette = @charlotte_bronte.write("Villette", "1853")
    assert_equal [jane_eyre, villette], @charlotte_bronte.books
  end
end
