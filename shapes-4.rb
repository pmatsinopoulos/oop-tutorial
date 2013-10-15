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

rectangle = Rectangle.new Point.new(2, 10), Point.new(15, 1)

puts rectangle.inspect

class Square
  attr_accessor :top_left, :side_width
  
  def initialize (top_left, side_width)
    @top_left = top_left
    @side_width = side_width
  end
  
  def bottom_right
    Point.new @top_left.x + @side_width, @top_left.y - @side_width
  end
end

square = Square.new Point.new(1, 5), 3

puts square.inspect
puts "Square has top_left: #{square.top_left.inspect} and bottom_right: #{square.bottom_right.inspect}"





                      
