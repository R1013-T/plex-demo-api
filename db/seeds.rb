seed_models = %i[companies]
seed_models.each do |model|
  require "./db/seeds/#{model}_seeds.rb"
end
