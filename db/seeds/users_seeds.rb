unless User.exists?
  10.times do |n|
    User.create!(
      name: "user#{n}",
      email: "user#{n}@example.com",
      password: "password",
      password_confirmation: "password",
      role: "other",
    )
  end
end