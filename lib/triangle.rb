require 'pry'

class Triangle
  attr_accessor :all_sides, :side_match_counter

  def initialize(side1, side2, side3)
    @all_sides = []
    @all_sides << side1
    @all_sides << side2
    @all_sides << side3
    @side_match_counter = 0
  end

  def positive?
    self.all_sides.all? {|side| side > 0}
  end

  def is_triangle?
    sorted_triangle = self.all_sides.sort
    biggest_side = sorted_triangle.pop
    biggest_side < sorted_triangle.sum
  end

  def triangle_type
    self.side_match_counter = self.all_sides.uniq.size
  end


  def kind
    if(positive? == false || is_triangle? == false)
        raise TriangleError
    else
      triangle_type
      if (@side_match_counter == 1)
        :equilateral
      elsif (@side_match_counter == 2)
        :isosceles
      else
        :scalene
      end
    end
  end

  class TriangleError < StandardError
    def message
      "not a triangle!!"
    end
  end


end
