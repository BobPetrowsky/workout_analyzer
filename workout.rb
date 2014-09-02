require 'table_print'
require "pry"
require "csv"

class Workout
  attr_reader :id, :exercises, :date

  def initialize(data)
    @id = data[0]
    @exercises = data[1][:exercises]
    @date = data[1][:date]
  end

  def total_duration_in_min
    total = 0

    exercises.each do |exercise|
      total += exercise[:duration_in_min]
    end

    total
  end

  def type
    strength = 0
    cardio = 0
      exercises.each do |x|
          if x[:category] == "cardio"
            cardio += 1
          end
          if x[:category] == "strength"
            strength += 1
          end
        end
        if strength > cardio
          type = "strength"
        elsif cardio > strength
          type = "cardio"
        else
          type = "other"
        end
  end

  def calories_burned
      cal = 0
      exercises.each do |x|
        if x[:intensity] == "high"
          cal += 10 * x[:duration_in_min]
        elsif x[:intensity] == "medium"
          cal += 8 * x[:duration_in_min]
        elsif x[:intensity] == "low"
          cal += 5 * x[:duration_in_min]
        else
          cal += 6 * x[:duration_in_min]
        end
      end
      cal
  end


end

# class Workout
#   def initialize(data)
#     @data = data
#   end

#   def id
#     id = []
#     @data.each do |key, value|
#       id << key
#     end
#     id
#   end

#   def date
#     date = []
#     @data.each do |key, value|
#       date << value[:date]
#     end
#     date
#   end

#   def type
#     arr = []
#     strength = 0
#     cardio = 0
#     @data.each do |key, value|
#       value[:exercises].each do |x|
#           if x[:category] == "cardio"
#             cardio += 1
#           end
#           if x[:category] == "strength"
#             strength += 1
#           end
#         end
#         if strength > cardio
#           type = "strength"
#         elsif cardio > strength
#           type = "cardio"
#         else
#           type = "other"
#         end
#         arr << type
#       end
#       arr
#   end

#   def duration
#     arr = []
#     @data.each do |key, value|
#       dur = 0
#       value[:exercises].each do |x|
#         dur += x[:duration_in_min].to_f
#       end
#       arr << dur
#     end
#     arr
#   end

#   def calories_burned
#     arr = []
#     @data.each do |key, value|
#       cal = 0
#       value[:exercises].each do |x|
#         if x[:intensity] == "high"
#           cal += 10 * x[:duration_in_min]
#         elsif x[:intensity] == "medium"
#           cal += 8 * x[:duration_in_min]
#         elsif x[:intensity] == "low"
#           cal += 5 * x[:duration_in_min]
#         else
#           cal += 6 * x[:duration_in_min]
#         end
#       end
#       arr << cal
#     end
#     arr
#   end

# end

