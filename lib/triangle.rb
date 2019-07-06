require 'pry'

class Triangle
  attr_accessor :side1, :side2, :side3, :all_sides

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
    @all_sides = []
    @all_sides << @side1
    @all_sides << @side2
    @all_sides << @side3
  end

  def positive?
    self.all_sides.all? {|side| side > 0}
  end

  def is_triangle?
    sorted_triangle = self.all_sides.sort { |a,b| a <=> b }
    biggest_side = sorted_triangle.pop
    biggest_side > sorted_triangle.sum
  end

  def kind
    if(positive? == false || is_triangle? == false)
        raise TriangleError
    elsif (equilateral?)
      :equilateral
    elsif (isosceles?)
      :isosceles
    elsif (scalene?)
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "not a triangle!!"
    end
  end


end
