unless Note.exists?
  users = User.all
  users.each do |user|
    Random.rand(0..3).times do
      user.notes.create!(title: "title", content: "content", company_id: Random.rand(1..5))
    end
  end
end

