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
  User.create!(
    name: "admin",
    email: "admin@example.com",
    password: "password",
    password_confirmation: "password",
    role: "manager",
    permission: "admin",
  )
  User.create!(
    name: "editor",
    email: "editor@example.com",
    password: "password",
    password_confirmation: "password",
    role: "engineer",
    permission: "editor",
  )
  User.create!(
    name: "viewer",
    email: "viewer@example.com",
    password: "password",
    password_confirmation: "password",
    role: "designer",
    permission: "viewer",
  )
end