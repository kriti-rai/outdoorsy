class Workout
  attr_accessor :title, :definition, :article, :group_title

  @@all =[]

  def initialize(workout_hash)
    workout_hash.each {|k,v| self.send("#{k}=",v)}
    @@all << self
  end

  def self.create_from_collection(workout_array)
    workout_array.map {|workout_hash| self.new(workout_hash)}
  end

  def self.all
    @@all
  end

end
