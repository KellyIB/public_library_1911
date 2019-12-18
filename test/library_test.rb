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
