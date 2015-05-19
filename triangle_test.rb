# 1. Copy this file from the course notes repo into a new repository
# 2. Run `ruby triangle_test.rb`. You should see 6 error messages.
# 3. Implement the Triangle class until all 6 tests are passing.
require "minitest/autorun"

class Triangle
  def initialize x, y, z
    @side1 = x
    @side2 = y
    @side3 = z
  end

  def is_numeric x, y, z
    a = Array.new
    a = [x,y,z]
      a.any? do |s|
        s.is_a?(Integer)
      end
  end

  def is_triangle x,y,z
    b = Array.new
    b = [x,y,z]
      b.any? do |s|
        s <= 0
      end
  end

  def kind 
    if is_numeric(@side1,@side2,@side3) == false || is_triangle(@side1,@side2,@side3)== true
      return :notvalid
    else
      if @side1==@side2 && @side1 == @side3
        :equilateral
      elsif @side1 != @side2 && @side1 != @side3 && @side2 != @side3
        :scalene
      else
        :isosceles
      end
    end
  end
  def perimeter
    if is_numeric(@side1,@side2,@side3) == false || is_triangle(@side1,@side2,@side3)== true
      return :notvalid
      else 
        @side1 + @side2 + @side3
      end
  end
 


end

class TestMeme < Minitest::Test
  def test_zero_side
    t = Triangle.new(0,1,2)
    assert_equal :notvalid, t.perimeter
  end

  def test_negative_side
    t = Triangle.new(-1,-2,-3)
    assert_equal :notvalid, t.kind
  end

  def test_string_input
    t = Triangle.new("some text", {foo: 2}, :apple)
    assert_equal :notvalid, t.kind
  end

  def test_equilateral
    t = Triangle.new(5,5,5)
    assert_equal :equilateral, t.kind
  end

  def test_isosceles
    s = Triangle.new(2,2,3)
    assert_equal :isosceles, s.kind
  end

  def test_other_isosceles
    t = Triangle.new 3,4,3
    assert_equal :isosceles, t.kind
  end

  def test_scalene
    t = Triangle.new 6,7,8
    assert_equal :scalene, t.kind
  end

  def test_perimeter_right
    t = Triangle.new(3,4,5)
    assert_equal 12, t.perimeter
  end

  def test_perimeter_eq
    t = Triangle.new 10,20,30
    assert_equal 60, t.perimeter
  end

end