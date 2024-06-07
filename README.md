# Library Management System

This is a Ruby on Rails application for managing a library's book inventory and user borrowings.

## Features

### Authentication and Authorization
- Users can register, log in, and log out.
- Two types of users: Librarian and Member.
- Only Librarian users can add, edit, or delete books.

### Book Management
- Ability to add a new book with details like title, author, genre, ISBN, and total copies.
- Ability to edit and delete book details.
- Search functionality: Users can search for a book by title, author, or genre.

### Borrowing and Returning
- Member users can borrow a book if it's available. They can't borrow the same book multiple times.
- The system tracks when a book was borrowed and when it's due (2 weeks from the borrowing date).
- Librarian users can mark a book as returned.

### Dashboard
- Librarian: A dashboard showing total books, total borrowed books, books due today, and a list of members with overdue books.
- Member: A dashboard showing books they've borrowed, their due dates, and any overdue books.

### API Endpoints
- RESTful API for CRUD operations on books and borrowings.
- Proper status codes and responses for each endpoint.
- Spec testing using RSpec for all requirements.

## Setup Instructions

### Prerequisites
- Ruby (>= 2.7.0)
- Rails (>= 6.0.0)
- Node.js and Yarn (for JavaScript dependencies)

### Initial Setup

1. **Clone the repository:**

    ```bash
    git clone <repository-url>
    cd LibraryManagement
    ```

2. **Install dependencies:**

    ```bash
    bundle install
    yarn install
    ```

3. **Set up the database:**

    The application is configured to use SQLite3 by default. You don't need to change the `config/database.yml` file unless you have a custom setup.

    Create and migrate the database:

    ```bash
    rails db:create
    rails db:migrate
    rails db:seed
    ```

4. **Run the application:**

    ```bash
    rails server
    ```

    Visit `http://localhost:3000` in your browser.

### Demo Credentials

- **Librarian:**
  - Email: librarian@example.com
  - Password: password

- **Member:**
  - Email: member0@example.com
  - Password: password

### Running Tests

To run the test suite, use the following command:

```bash
bundle exec rspec
