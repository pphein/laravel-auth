CREATE TABLE books (
  id BIGSERIAL PRIMARY KEY,
  title VARCHAR(150) NOT NULL,
  summary TEXT,
  price INTEGER CHECK (price >= 0),
  isbn VARCHAR(64) NOT NULL UNIQUE,
  copy_availables INTEGER NOT NULL CHECK (copy_availables >= 0),
  copy_borrowed INTEGER NOT NULL DEFAULT 0 CHECK (copy_borrowed >= 0),
  cover_image VARCHAR(255),
  created_at TIMESTAMP DEFAULT NULL,
  updated_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE authors (
  id BIGSERIAL PRIMARY KEY,
  pen_name VARCHAR(64) NOT NULL UNIQUE,
  name VARCHAR(64),
  gender VARCHAR(16),
  biography TEXT,
  created_at TIMESTAMP DEFAULT NULL,
  updated_at TIMESTAMP DEFAULT NULL
);

CREATE TABLE book_author (
  book_id BIGINT NOT NULL,
  author_id BIGINT NOT NULL,
  created_at TIMESTAMP DEFAULT NULL,
  updated_at TIMESTAMP DEFAULT NULL,
  PRIMARY KEY (book_id, author_id),
  CONSTRAINT book_author_author_id_foreign FOREIGN KEY (author_id) REFERENCES authors (id) ON DELETE CASCADE,
  CONSTRAINT book_author_book_id_foreign FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE CASCADE
);

CREATE TABLE borrowed_books (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL,
  book_id BIGINT NOT NULL,
  borrowed_at TIMESTAMP DEFAULT NULL,
  returned_at TIMESTAMP DEFAULT NULL,
  created_at TIMESTAMP DEFAULT NULL,
  updated_at TIMESTAMP DEFAULT NULL,
  CONSTRAINT borrowed_books_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  CONSTRAINT borrowed_books_book_id_foreign FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE CASCADE
);

CREATE TABLE cache (
  key VARCHAR(255) NOT NULL PRIMARY KEY,
  value TEXT NOT NULL,
  expiration INTEGER NOT NULL
);

CREATE TABLE cache_locks (
  key VARCHAR(255) NOT NULL PRIMARY KEY,
  owner VARCHAR(255) NOT NULL,
  expiration INTEGER NOT NULL
);

CREATE TABLE carts (
  id BIGSERIAL PRIMARY KEY,
  user_id BIGINT NOT NULL,
  book_id BIGINT NOT NULL,
  quantity INTEGER NOT NULL DEFAULT 1,
  created_at TIMESTAMP DEFAULT NULL,
  updated_at TIMESTAMP DEFAULT NULL,
  CONSTRAINT carts_user_id_foreign FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
  CONSTRAINT carts_book_id_foreign FOREIGN KEY (book_id) REFERENCES books (id) ON DELETE CASCADE
);

CREATE TABLE failed_jobs (
  id BIGSERIAL PRIMARY KEY,
  uuid VARCHAR(255) NOT NULL UNIQUE,
  connection TEXT NOT NULL,
  queue TEXT NOT NULL,
  payload TEXT NOT NULL,
  exception TEXT NOT NULL,
  failed_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE job_batches (
  id VARCHAR(255) PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  total_jobs INTEGER NOT NULL,
  pending_jobs INTEGER NOT NULL,
  failed_jobs INTEGER NOT NULL,
  failed_job_ids TEXT NOT NULL,
  options TEXT,
  cancelled_at INTEGER DEFAULT NULL,
  created_at INTEGER NOT NULL,
  finished_at INTEGER DEFAULT NULL
);

CREATE TABLE jobs (
  id BIGSERIAL PRIMARY KEY,
  queue VARCHAR(255) NOT NULL,
  payload TEXT NOT NULL,
  attempts SMALLINT NOT NULL,
  reserved_at INTEGER DEFAULT NULL,
  available_at INTEGER NOT NULL,
  created_at INTEGER NOT NULL
);