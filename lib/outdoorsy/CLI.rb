#CLI Controller
class Outdoorsy::CLI

  def call
    puts <<~HEREDOC
                    ||                      ||
                  ||||||                  ||||||
        =========||||||||================||||||||=========
                  ||||||                  ||||||
                    ||                      ||
    HEREDOC
    sleep(1)
    puts "Tired of your old workout routine? Need some guidance or something new?"
    sleep(1.5)
    puts "Look no further."
    sleep(1.5)
    puts "SwoleMate has got your back!"
    sleep(1.5)
    puts"We provide you with a list of latest in workouts that you can include in your routine to attain your dream body."
    sleep (1.5)
    puts <<~HEREDOC
        +++++++++++++++++++++++++++++++++++++++++++++++++++
        +                                                 +
        +              Let’s get swole!                   +
        +                                                 +
        +++++++++++++++++++++++++++++++++++++++++++++++++++
    HEREDOC
    sleep (1.5)
    puts "Type “list” to check out the latest in workout."
  end

  def list
  end
end
