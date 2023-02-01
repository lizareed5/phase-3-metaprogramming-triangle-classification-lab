class Triangle
  attr_accessor :a, :b, :c

  def initialize (a, b, c)
    self.a = a
    self.b = b
    self.c = c
  end

  def kind
    validate_triangle
    if a == b && b == c
      :equilateral
    elsif a == b || b == c || a == c
      :isosceles
    else
      :scalene
    end
  end

  def sides_greater_than_zero?
    a > 0 && b > 0 && c > 0
    # [a, b, c].all?(&:positive?)
  end

  def triangle_inequality?
    a + b > c && a + c > b && b + c > a
  end

  def validate_triangle
    raise TriangleError unless sides_greater_than_zero? && triangle_inequality?
  end

  class TriangleError < StandardError

  end

end
