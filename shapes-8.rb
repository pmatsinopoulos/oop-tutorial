class Point
  attr_accessor :x, :y
  
  def initialize(x, y) # Constructor of class Point. This is a method.
    @x = x
    @y = y
  end
end

class Shape
  attr_accessor :color
  
  def initialize (color)
    @color = color
  end
end

class Rectangle < Shape
  attr_accessor :top_left, :bottom_right
  
  def initialize (color, top_left, bottom_right)
    @color = color
    @top_left = top_left
    @bottom_right = bottom_right
  end
end

rectangle = Rectangle.new 'red', Point.new(2, 10), Point.new(15, 1)

puts rectangle.inspect

class Square < Rectangle
  attr_accessor :side_width
  
  def initialize (color, top_left, side_width)
    @color = color
    @top_left = top_left
    @side_width = side_width
  end
  
  def bottom_right
    Point.new @top_left.x + @side_width, @top_left.y - @side_width
  end
  
  def bottom_right= (value)
    puts "ERROR: Please, do not call me on squares. It's not necessary"
  end
end

square = Square.new 'blue', Point.new(1, 5), 3

puts square.inspect
puts "Square has top_left: #{square.top_left.inspect} and bottom_right: #{square.bottom_right.inspect}"

square.bottom_right = Point.new(15, 3)

class Circle < Shape
  attr_accessor :center, :radius
  
  def initialize (color, center, radius)
    @color = color
    @center = center
    @radius = radius
  end
end

circle = Circle.new 'black', Point.new(5, 15), 2
puts circle.inspect

[rectangle, square, circle].each do |shape|
  puts "Shape with color: #{shape.color}"
end 





                      