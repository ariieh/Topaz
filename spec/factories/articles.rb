FactoryGirl.define do
  factory :article do
    title "Test Title"
    body "Test body"
    author User.new(username: "test1", email: "test@example.com", password_digest: "3333")
  end
end