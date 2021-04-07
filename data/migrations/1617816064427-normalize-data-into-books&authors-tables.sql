<!-- Query 1: Create authors table -->
CREATE TABLE AUTHORS (id SERIAL PRIMARY KEY, name VARCHAR(255));
A second table in the lab14_normal database named authors was created.

<!-- Query 2:  Select distinct authors from the books table and insert into the authors table -->
INSERT INTO authors(name) SELECT DISTINCT author FROM books;
Retrieve unique author values from the books table and insert each one into the authors table in the name column

<!-- Query 3: Alter the books table to include a field for author id -->
ALTER TABLE books ADD COLUMN author_id INT;
Adding a column to the books table named author_id

<!-- Query 4: Retrieves the primary key on each author and fills in the author id field in the books table -->
UPDATE books SET author_id=author.id FROM (SELECT * FROM authors) AS author WHERE books.author = author.name;
Preparing a connection between the two tables.

<!-- Query 5: Retrieves the primary key on each author and fills in the author id field in the books table -->
ALTER TABLE books DROP COLUMN author;
Modifing the books table by removing the column named author.

<!-- Query 6: Set the author_id as the foreign key of the books table -->
ALTER TABLE books ADD CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id);
Modify the data type of the author_id in the books table, setting it as a foreign key which references the primary key in the authors table.