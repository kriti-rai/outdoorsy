require 'pry'
class SwoleNews::Workout
  attr_accessor :title, :definition, :article
  @@all =[]
  def initialize(workout_hash)
    workout_hash.each {|k,v| self.send("#{k}=",v)}
    # @@all << self
    #this needs to be re-written
    #workout needs to know they belong to an article
  end

  def self.create_from_collection(workout_array)
    workout_array.each {|workout_hash| self.new(workout_hash)}
  end

  def self.all
    @@all
  end

end
