class Point
  attr_accessor :x, :y
  
  def initialize(x, y) # Constructor of class Point. This is a method.
    @x = x
    @y = y
  end
end

class Rectangle
  attr_accessor :top_left, :bottom_right
  
  def initialize (top_left, bottom_right)
    @top_left = top_left
    @bottom_right = bottom_right
  end
end

point1 = Point.new 2, 10
point2 = Point.new  15, 1

rectangle = Rectangle.new point1, point2

puts rectangle.inspect




                      
