# Create Librarian
User.create!(email: 'librarian@example.com', password: 'password', role: :librarian)

# Create Members
5.times do |i|
  User.create!(email: "member#{i}@example.com", password: 'password', role: :member)
end

# Create Books
10.times do |i|
  Book.create!(
    title: Faker::Book.title,
    author: Faker::Book.author,
    genre: Faker::Book.genre,
    isbn: Faker::Number.number(digits: 13),
    total_copies: rand(1..5)
  )
end
