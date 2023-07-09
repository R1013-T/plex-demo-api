unless User.exists?
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
  User.create!(
    name: "guest",
    email: "guest@example.com",
    password: "password",
    password_confirmation: "password",
    role: "other",
    permission: "guest",
    )
end