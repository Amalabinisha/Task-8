USE binisha;
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Category VARCHAR(50),
    PublishedYear INT
);

INSERT INTO Books VALUES
(1, 'Data Science Basics', 'Technology', 2018),
(2, 'World History', 'History', 2005),
(3, 'Python Programming', 'Technology', 2022),
(4, 'Ancient Civilizations', 'History', 1999);

DELIMITER $$
CREATE FUNCTION BookStatus(pub_year INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    IF pub_year < 2010 THEN
        RETURN 'Old';
    ELSE
        RETURN 'New';
    END IF;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE ShowBooksByCategory(IN cat_name VARCHAR(50))
BEGIN
    SELECT Title, PublishedYear, BookStatus(PublishedYear) AS Status
    FROM Books
    WHERE Category = cat_name;
END $$
DELIMITER ;

CALL ShowBooksByCategory('History');
