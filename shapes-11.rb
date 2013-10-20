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
  
  def draw
	puts "I am #{self.class.name}, my color is #{@color} and I am drawing myself"
  end
  
  def area
    puts "ERROR: Please don't call area on me. Call it on a specific object"
  end
end

class Rectangle < Shape
  attr_accessor :top_left, :bottom_right
  
  def initialize (color, top_left, bottom_right)
    @color = color
    @top_left = top_left
    @bottom_right = bottom_right
  end
  
  def area
    width * height
  end
  
  def draw
    puts "... I will draw a line from #{top_left.x},#{top_left.y} to #{bottom_right.x},#{top_left.y}"
    puts "... then I will draw a line from #{bottom_right.x},#{top_left.y} to #{bottom_right.x},#{bottom_right.y}"
    puts "... then I will draw a line from #{bottom_right.x},#{bottom_right.y} to #{top_left.x},#{bottom_right.y}"
    puts "... then I will draw a line from #{top_left.x},#{bottom_right.y} to #{top_left.x},#{top_left.y}"
  end
  
  def width
    @bottom_right.x - @top_left.x
  end
  
  def height
    @top_left.y - @bottom_right.y
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
  
  def area
    @side_width ** 2
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
  
  def area
    3.1415927 * @radius ** 2
  end
end

circle = Circle.new 'black', Point.new(5, 15), 2
puts circle.inspect

[rectangle, square, circle].each do |shape|
  puts "Shape with color: #{shape.color}"
end 

[rectangle, square, circle].each do |shape|
  puts "Shape with area: #{shape.area}"
end 

puts "Let us call DRAW method on all of our shapes..."
[rectangle, square, circle].each do |shape|
  shape.draw
end 








                      
