# This program demonstrates lots of things about Object Oriented Programming
# with Ruby, about Classes & Objects and about inheritance, polymorphism
# and encapsulation
#
class Point
  attr_accessor :x, :y
  
  def initialize(x, y) # Constructor of class Point. This is a method.
    @x = x
    @y = y
  end
end

class Shape
  attr_accessor :name
  def initialize(name)
    @name = name
  end
  
  def draw
    puts "I am #{self.class.name}, my name is #{name} and I am drawing myself"
  end
  
  def area
    puts "ERROR: Don't call area on me. Call it on a specific class"
  end 
end
 
class Rectangle < Shape
  attr_accessor :top_left, :bottom_right
  def initialize(name, top_left, bottom_right)
    super name
    @top_left = top_left
    @bottom_right = bottom_right
  end
   
  def area
    width * height
  end
  
  def draw
    super
    puts "...I will draw a line from #{top_left.x},#{top_left.y} to #{bottom_right.x},#{top_left.y}"
    puts "...then I will draw a line from #{bottom_right.x},#{top_left.y} to #{bottom_right.x},#{bottom_right.y}"
    puts "...then I will draw a line from #{bottom_right.x},#{bottom_right.y} to #{top_left.x},#{bottom_right.y}"
  end 
  
  protected
   
  def width
    bottom_right.x - top_left.x
  end
   
  def height
    top_left.y - bottom_right.y
  end
end
  
class Square < Rectangle
  attr_accessor :side_width
  def initialize(name, top_left, side_width)
    @name = name
    @top_left = top_left
    @side_width = side_width
  end
   
  def bottom_right
    Point.new @top_left.x + @side_width, @top_left.y - @side_width
  end
end
 
class Circle < Shape
  attr_accessor :center, :radius  
  def initialize(name, center, radius)
    super name
    @center = center
    @radius = radius
  end
  
  def draw
	super
	puts "...I will draw with center: #{center.x},#{center.y} and radius: #{radius}"
  end
  
  def area
    3.1415927 * radius ** 2
  end
end

class Canvas < Rectangle
  attr_reader :shapes
  def initialize (name, top_left, bottom_right)
    super
    @shapes = []
  end
  
  def add_shape (shape)
    shapes << shape
  end
  
  def remove_shape (shape)
    shapes.delete shape
  end
  
  def draw
    shapes.each do |shape|
      shape.draw
    end
  end  
end

rectangle = Rectangle.new 'my rect', Point.new(10, 20), Point.new(15, 10)
square = Square.new 'my sqr', Point.new(10, 30), 15
circle = Circle.new 'my circle', Point.new(15, 25), 25
canvas = Canvas.new 'my canvas', Point.new(0, 50), Point.new(100, 0)

canvas.add_shape(rectangle)
canvas.add_shape(square)
canvas.add_shape(circle)

canvas.draw

# print all areas:
canvas.shapes.each do |s|
  puts "Shape #{s.name} area is #{s.area}"
end

puts "Removing #{square.name}...."

canvas.remove_shape(square)

canvas.draw

# print all areas:
canvas.shapes.each do |s|
  puts "Shape #{s.name} area is #{s.area}"
end


