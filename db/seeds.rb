seed_models = %i[users companies notes]

all_process_time = Benchmark.realtime do
  seed_models.each do |model|
    puts "---------- Start: #{model} ----------"
    puts "Count from: #{model.to_s.classify.constantize.count}"
    process_time = Benchmark.realtime do
      require "./db/seeds/#{model}_seeds.rb"
    end
    puts "Count to: #{model.to_s.classify.constantize.count}"
    puts "Process time: #{format('%.4<time>f', time: process_time)}s"
    puts "---------- End: #{model} ----------"
  end
end
puts "All process time: #{format('%.4<time>f', time: all_process_time)}s"