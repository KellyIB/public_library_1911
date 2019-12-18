require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/book'
require './lib/author'
require './lib/library'

class LibraryTest <Minitest::Test

  def setup
    @charlotte_bronte = Author.new({first_name: "Charlotte", last_name: "Bronte"})
    @harper_lee = Author.new({first_name: "Harper", last_name: "Lee"})
    @dpl = Library.new("Denver Public Library")
  end

  def test_it_exists
    assert_instance_of Library, @dpl
  end

  def test_it_it_starts_with_a_name_and_no_authors_or_books
    assert_equal "Denver Public Library", @dpl.name
    assert_equal [], @dpl.authors
    assert_equal [], @dpl.books
  end

  def test_it_can_add_books_and_authors_by_adding_authors
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    the_proffesor = @charlotte_bronte.write("The Professor", "1857")
    villette = @charlotte_bronte.write("Villette", "1853")
    mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      assert_equal [@charlotte_bronte, @harper_lee], @dpl.authors
      assert_equal [jane_eyre, the_proffesor, villette, mockingbird], @dpl.books
  end

  def test_it_can_find_the_publication_time_frame
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    the_proffesor = @charlotte_bronte.write("The Professor", "1857")
    villette = @charlotte_bronte.write("Villette", "1853")
    mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
      assert_equal ({start: "1847", end: "1857"}), @dpl.publication_time_frame_for(@charlotte_bronte)
      assert_equal ({start: "1960", end: "1960"}), @dpl.publication_time_frame_for(@harper_lee)
  end

  def test_it_has_no_books_checked_out_but_can_checkout_books_and_then_return
    jane_eyre = @charlotte_bronte.write("Jane Eyre", "October 16, 1847")
    the_proffesor = @charlotte_bronte.write("The Professor", "1857")
    villette = @charlotte_bronte.write("Villette", "1853")
    mockingbird = @harper_lee.write("To Kill a Mockingbird", "July 11, 1960")
    # binding.pry
    assert_equal "This book cannot be checked out because it doesn't exist in the library", @dpl.checkout(mockingbird)
    assert_equal "This book cannot be checked out because it doesn't exist in the library", @dpl.checkout(mockingbird)
      @dpl.add_author(@charlotte_bronte)
      @dpl.add_author(@harper_lee)
    assert_equal true, @dpl.checkout(mockingbird)
    assert_equal true, @dpl.checkout(villette)
    assert_equal false, @dpl.return(mockingbird)
    assert_equal false, @dpl.return(villette)
  end

end

## Iteration 4

# Use TDD to implement the following methods on the `Library` class:
#
# The `checkout` method takes a `Book` as an argument. It should return `false` if a `Book` does not exist in the library or it is already checked out. Otherwise, it should return true indicating that the book has been checked out.
#
# The `checked_out_books` method should return an array of books that are currently checked out.
#
# The `return` method takes a `Book` as an argument. Calling this method means that a book is no longer checked out.
#
# The `most_popular_book` method should return the book that has been checked out the most.
#
#
# # This book cannot be checked out because it doesn't exist in the library
# pry(main)> dpl.checkout(mockingbird)
# #=> false
#
# # This book cannot be checked out because it doesn't exist in the library
# pry(main)> dpl.checkout(jane_eyre)
# #=> false
#
# pry(main)> dpl.add_author(charlotte_bronte)
#
# pry(main)> dpl.add_author(harper_lee)
#
# pry(main)> dpl.checkout(jane_eyre)
# #=> true
#
# pry(main)> dpl.checked_out_books
# #=> [#<Book:0x00007f8c01433138...>]
#
# # This book cannot be checked out because it is currently checked out
# pry(main)> dpl.checkout(jane_eyre)
# #=> false
#
# pry(main)> dpl.return(jane_eyre)
#
# # Returning a book means it should no longer be checked out
# pry(main)> dpl.checked_out_books
# #=> []
#
# pry(main)> dpl.checkout(jane_eyre)
# #=> true
#
# pry(main)> dpl.checkout(villette)
# #=> true
#
# pry(main)> dpl.checked_out_books
# #=> [#<Book:0x00007f8c01433138...>, #<Book:0x00007f8c021d84c8...>]
#
# pry(main)> dpl.checkout(mockingbird)
# #=> true
#
# pry(main)> dpl.return(mockingbird)
#
# pry(main)> dpl.checkout(mockingbird)
# #=> true
#
# pry(main)> dpl.return(mockingbird)
#
# pry(main)> dpl.checkout(mockingbird)
# #=> true
#
# pry(main)> dpl.most_popular_book
# #=> #<Book:0x00007f8c019506c0...>
# ```
