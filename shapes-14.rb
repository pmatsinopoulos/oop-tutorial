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
    super
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
  
  def draw
    super
    puts "... I will draw with center: #{center.x},#{center.y} and radius: #{radius}"
  end
end

class Canvas < Rectangle
  attr_reader :shapes # instead of using attr_accessor we use attr_reader which only creates a getter automatically and makes it public
  
  def initialize (color, top_left, bottom_right)
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
  
  def print_all_areas
    shapes.each do |shape|
      puts "Shape #{shape.color} area is #{shape.area}"
    end
  end
end

rectangle = Rectangle.new 'red', Point.new(2, 10), Point.new(15, 1)
square = Square.new 'blue', Point.new(1, 5), 3
circle = Circle.new 'black', Point.new(5, 15), 2

canvas = Canvas.new 'Yellow', Point.new(0, 50), Point.new(100, 0)

canvas.draw
canvas.print_all_areas

canvas.add_shape rectangle
canvas.add_shape square
canvas.add_shape circle

canvas.draw
canvas.print_all_areas

puts "Removing square ........."
canvas.remove_shape(square)

canvas.draw
canvas.print_all_areas












                      
