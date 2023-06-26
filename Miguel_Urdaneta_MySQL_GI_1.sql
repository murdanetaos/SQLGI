-- EASY
-- Create the FavoriteBooks table
-- CREATE TABLE FavoriteBooks (
--   Title VARCHAR(255),
--   PublishDate DATE,
--   AuthorFullName VARCHAR(255)
-- );

-- -- Insert the initial top five favorite books
-- INSERT INTO FavoriteBooks (Title, PublishDate, AuthorFullName)
-- VALUES
--   ('1984', '1949-06-08', 'George Orwell'),
--   ('To Kill a Mockingbird', '1960-07-11', 'Harper Lee'),
--   ('The Great Gatsby', '1925-04-10', 'F. Scott Fitzgerald'),
--   ('Pride and Prejudice', '1813-01-28', 'Jane Austen'),
--   ('The Catcher in the Rye', '1951-07-16', 'J.D. Salinger');

-- -- Query to add two new books
-- INSERT INTO FavoriteBooks (Title, PublishDate, AuthorFullName)
-- VALUES
--   ('The Lord of the Rings', '1954-07-29', 'J.R.R. Tolkien'),
--   ('Harry Potter and the Sorcerer''s Stone', '1997-06-26', 'J.K. Rowling');

-- -- Query to remove the oldest book
-- DELETE FROM FavoriteBooks
-- WHERE PublishDate = (SELECT MIN(PublishDate) FROM FavoriteBooks);

-- -- Query to show the total number of books in the table
-- SELECT COUNT(*) AS TotalBooks FROM FavoriteBooks;
-- MEDIUM
-- Create the TopMovies table
-- CREATE TABLE TopMovies (
--   Title VARCHAR(255),
--   ReleaseDate DATE,
--   Rating DECIMAL(3,1)
-- );

-- -- Insert the top 10 movies
-- INSERT INTO TopMovies (Title, ReleaseDate, Rating)
-- VALUES
--   ('The Shawshank Redemption', '1994-09-23', 9.3),
--   ('The Godfather', '1972-03-24', 9.2),
--   ('The Dark Knight', '2008-07-18', 9.0),
--   ('Pulp Fiction', '1994-10-14', 8.9),
--   ('Fight Club', '1999-10-15', 8.8),
--   ('Inception', '2010-07-16', 8.7),
--   ('Goodfellas', '1990-09-19', 8.7),
--   ('The Matrix', '1999-03-31', 8.7),
--   ('Seven', '1995-09-22', 8.6),
--   ('The Silence of the Lambs', '1991-02-14', 8.6);

-- -- Query to retrieve movies with titles containing the letter "s" in order of release date
-- SELECT Title, ReleaseDate, Rating
-- FROM TopMovies
-- WHERE Title LIKE '%s%'
-- ORDER BY ReleaseDate;
-- Create the TopMovies table
-- REATE TABLE TopMovies (
--   Title VARCHAR(255),
--   ReleaseDate DATE,
--   Rating DECIMAL(3,1),
--   DirectorFirstName VARCHAR(255),
--   DirectorLastName VARCHAR(255)
-- );

-- -- Insert the top 10 movies with director information
-- INSERT INTO TopMovies (Title, ReleaseDate, Rating, DirectorFirstName, DirectorLastName)
-- VALUES
--   ('The Shawshank Redemption', '1994-09-23', 9.3, 'Frank', 'Darabont'),
--   ('The Godfather', '1972-03-24', 9.2, 'Francis', 'Ford Coppola'),
--   ('The Dark Knight', '2008-07-18', 9.0, 'Christopher', 'Nolan'),
--   ('Pulp Fiction', '1994-10-14', 8.9, 'Quentin', 'Tarantino'),
--   ('Fight Club', '1999-10-15', 8.8, 'David', 'Fincher'),
--   ('Inception', '2010-07-16', 8.7, 'Christopher', 'Nolan'),
--   ('Goodfellas', '1990-09-19', 8.7, 'Martin', 'Scorsese'),
--   ('The Matrix', '1999-03-31', 8.7, 'Lana', 'Wachowski'),
--   ('Seven', '1995-09-22', 8.6, 'David', 'Fincher'),
--   ('The Silence of the Lambs', '1991-02-14', 8.6, 'Jonathan', 'Demme');

-- -- Query to retrieve movies with titles containing the letter "s" in order of release date
-- SELECT Title, ReleaseDate, Rating, DirectorFirstName, DirectorLastName
-- FROM TopMovies
-- WHERE Title LIKE '%s%'
-- ORDER BY ReleaseDate;

-- -- Query to concatenate director's first name and last name
-- SELECT Title, CONCAT(DirectorFirstName, ' ', DirectorLastName) AS DirectorFullName
-- FROM TopMovies;

-- -- Query to order the list by last name (A-Z)
-- SELECT Title, ReleaseDate, Rating, DirectorFirstName, DirectorLastName
-- FROM TopMovies
-- ORDER BY DirectorLastName;

-- -- Query to remove movies where the last name ends with "R-Z"
-- DELETE FROM TopMovies
-- WHERE DirectorLastName LIKE '%[R-Z]';

-- -- Query to retrieve the first movie in the list
-- SELECT TOP 1 Title, ReleaseDate, Rating, DirectorFirstName, DirectorLastName
-- FROM TopMovies;
-- --VERY HARD
-- Create the Cars table
-- CREATE TABLE Cars (
--   CarID INT AUTO_INCREMENT PRIMARY KEY,
--   Make VARCHAR(255),
--   Model VARCHAR(255),
--   Price DECIMAL(10, 2),
--   Color VARCHAR(255)
-- );

-- -- Insert three cars at once
-- INSERT INTO Cars (Make, Model)
-- VALUES
--   ('Toyota', 'Corolla'),
--   ('Honda', 'Accord'),
--   ('Ford', 'Mustang');

-- -- Query to add prices and colors for each car
-- UPDATE Cars
-- SET Price = CASE CarID
--     WHEN 1 THEN 20000.00
--     WHEN 2 THEN 25000.00
--     WHEN 3 THEN 30000.00
--   END,
--   Color = CASE CarID
--     WHEN 1 THEN 'Silver'
--     WHEN 2 THEN 'Blue'
--     WHEN 3 THEN 'Red'
--   END;

-- -- Query to concatenate make and model in one column
-- SELECT CONCAT(Make, ' ', Model) AS MakeAndModel
-- FROM Cars;

-- -- Query to add a column for the count of cars with the same make
-- ALTER TABLE Cars
-- ADD COLUMN MakeCount INT;

-- -- Query to update the MakeCount column with the count of cars with the same make
-- UPDATE Cars c
-- JOIN (
--   SELECT Make, COUNT(*) AS Count
--   FROM Cars
--   GROUP BY Make
-- ) sub ON c.Make = sub.Make
-- SET c.MakeCount = sub.Count;
--  