require_relative 'workout'
require 'csv'

# create a hash of workout info from CSV
def load_workout_data(filename)
  workouts = {}

  CSV.foreach(filename, headers: true, header_converters: :symbol, converters: :numeric) do |row|
    workout_id = row[:workout_id]

    if !workouts[workout_id]
      workouts[workout_id] = {
        date: row[:date],
        exercises: []
      }
    end

    exercise = {
      name: row[:exercise],
      category: row[:category],
      duration_in_min: row[:duration_in_min],
      intensity: row[:intensity]
    }

    workouts[workout_id][:exercises] << exercise
  end

  workouts
end

data = load_workout_data("workouts.csv")

workouts = []

data.each do |workout_data|
  workouts << Workout.new(workout_data)
end

workouts.each do |workout|
  puts [workout.id, workout.date, workout.type, workout.calories_burned, workout.total_duration_in_min].join("\t")
end

w = Workout.new(data)

binding.pry




