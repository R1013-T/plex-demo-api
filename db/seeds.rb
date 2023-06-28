seed_models = %i[companies notes]
seed_models.each do |model|
  require "./db/seeds/#{model}_seeds.rb"
end
