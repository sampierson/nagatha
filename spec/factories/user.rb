Factory.define :user do |f|
  f.password "password"
  f.password_confirmation { |u| u.password }
  f.sequence(:email) { |n| "user#{n}@example.com" }
end
