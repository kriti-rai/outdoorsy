require 'pry'
class SwoleNews::Workout
  attr_accessor :title, :definition, :article

  def initialize(workout_hash)
    workout_hash.each {|k,v| self.send("#{k}=",v)}
  end

  def self.create_from_collection(workout_array)
    workout_array.each {|workout_hash| self.new(workout_hash)}
  end

end
