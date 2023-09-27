# Класс, представляющий прототип
class Prototype
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age = age
  end

  # Метод для создания поверхностной копии объекта
  def clone
    duplicate = self.dup
    duplicate.name = @name.dup
    duplicate.age = @age
    duplicate
  end
end

# Класс, создающий объекты на основе прототипа
class ObjectFactory
  def initialize(prototype)
    @prototype = prototype
  end

  def create_object
    @prototype.clone
  end
end

# Пример использования
puts "Введите имя:"
name = gets.chomp

puts "Введите возраст:"
age = gets.chomp.to_i

# Создаем прототип
prototype = Prototype.new(name, age)

# Создаем фабрику объектов на основе прототипа
factory = ObjectFactory.new(prototype)

# Создаем новые объекты на основе прототипа
object1 = factory.create_object
object2 = factory.create_object

# Выводим информацию о созданных объектах
puts "Объект 1: #{object1.name}, #{object1.age} лет"
puts "Объект 2: #{object2.name}, #{object2.age} лет"
