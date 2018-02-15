-- --                         *SELECT CHALLENGES*

-- -- Bronze #1               *DONE*

-- SELECT MediaType.Name
--      FROM MediaType;


-- -- Bronze #2               *DONE*

-- SELECT Employee.FirstName, Employee.LastName, Employee.Title
--      FROM Employee
--      WHERE Employee.Title = 'IT Staff';


-- -- Bronze #3               *DONE*

-- SELECT Track.Name AS 'Track', MediaType.Name AS 'Media Type'
--      From Track
--           JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId;


-- -- Silver #1               *DONE*

-- SELECT Track.Name AS 'Track', Genre.Name AS 'Genre'
--      FROM Track
--           JOIN Genre ON Track.GenreId = Genre.GenreId
--      WHERE Genre.Name = 'Jazz';


-- -- Silver #2               *DONE*

-- SELECT Track.Name AS 'Track', Genre.Name AS 'Genre'
--      FROM Track
--           JOIN Genre ON Track.GenreId = Genre.GenreId
--           JOIN MediaType ON Track.MediaTypeId = MediaType.MediaTypeId
--      WHERE MediaType.Name = 'Protected AAC audio file' AND Genre.Name = 'Soundtrack';



-- -- GOLD #1                 *DONE*

-- SELECT Playlist.Name AS 'Playlist', Track.Name AS 'Track', Album.Title AS 'Album', Artist.Name AS 'Artist'
--      FROM Playlist
--           JOIN PlaylistTrack ON Playlist.PlaylistId = PlaylistTrack.PlaylistId
--           JOIN Track ON PlaylistTrack.TrackId = Track.TrackId
--           JOIN Album ON Track.AlbumId = Album.AlbumId
--           JOIN Artist ON Album.ArtistId = Artist.ArtistId
--      WHERE Playlist.PlaylistId = 16;


-- -- GOLD #2                 *DONE*

-- SELECT Playlist.Name, PlaylistTrack.TrackId AS Track, PlaylistTrack.PlaylistId
--      FROM Playlist
--           JOIN PlaylistTrack On Playlist.PlaylistId = PlaylistTrack.PlaylistId
--      GROUP BY Playlist.PlaylistId
--      HAVING COUNT(PlaylistTrack.TrackId) = 1;


-- -- GOLD #3



-- --                         *ORDER BY CHALLENGES*

-- -- Bronze #1               *DONE*

-- SELECT InvoiceDate, BillingAddress, Total
--      FROM Invoice
--      ORDER BY InvoiceDate DESC

-- -- Bronze #2               *DONE*

-- SELECT EmployeeId, LastName, FirstName, HireDate
--      FROM Employee
--      ORDER BY HireDate DESC
--      LIMIT 3;

-- -- Silver #1               *DONE*

-- SELECT EmployeeId, LastName, FirstName, HireDate
--      FROM Employee
--      ORDER BY HireDate DESC, EmployeeId DESC
--      LIMIT 3;

-- -- GOLD #1                 *DONE*

-- SELECT Customer.FirstName, Customer.LastName, InvoiceDate, Invoice.Total
--      FROM Invoice
--           JOIN Customer ON Invoice.CustomerId = Customer.CustomerId
--      GROUP BY Invoice.Total, Customer.FirstName
--      ORDER BY Invoice.Total DESC
--      LIMIT 10;


-- --                         *AGGREGATING FUNCTIONS CHALLENGES*

-- -- Bronze #1               *DONE*

-- SELECT MIN(HireDate) AS Hired
--      FROM Employee
     
-- -- Bronze #2               *DONE*

-- SELECT MAX(BirthDate) AS "Birth Date"
--      FROM Employee

-- -- Bronze #3               *DONE*

-- SELECT Employee.FirstName, COUNT(*) AS "Count"
--      FROM Employee
--           JOIN Customer ON Employee.EmployeeId = Customer.SupportRepId
--      WHERE Employee.EmployeeId = 4

-- -- Silver #1               *DONE*

-- SELECT Employee.FirstName, Employee.LastName, COUNT(Employee.FirstName) AS "Count"
--      FROM Employee
--           JOIN Customer ON Employee.EmployeeId = Customer.SupportRepId
--      WHERE Employee.FirstName = "Jane" AND Employee.LastName = "Peacock"

-- -- GOLD #1                 *DONE*

-- SELECT MediaType.Name AS "Media Type"
--      FROM MediaType
--           JOIN Track ON MediaType.MediaTypeId = Track.MediaTypeId
--      GROUP BY Track.MediaTypeId
--      ORDER BY COUNT(*) DESC
--      LIMIT 1;


-- --                         *GROUP BY CHALLENGES*

-- -- Bronze #1               *DONE*

-- SELECT COUNT(Customer.FirstName) AS "Amount", Customer.City
--      FROM Customer
--      WHERE Customer.City = "Berlin"

-- -- Silver #1               *DONE*

-- SELECT Track.Name, SUM(InvoiceLine.UnitPrice * InvoiceLine.Quantity) AS Amount
--      From Track
--           JOIN InvoiceLine ON Track.TrackId = InvoiceLine.TrackId
--      WHERE Track.Name = "The Woman King"
--      GROUP BY Track.Name

-- -- GOLD #1                 *DONE*

-- SELECT Artist.Name AS Artist, COUNT(Artist.Name) AS "Count"
--      FROM Artist
--           JOIN Album ON Artist.ArtistId = Album.ArtistId
--           JOIN Track ON Album.AlbumId = Track.AlbumId
--      GROUP BY Artist.Name
--      ORDER BY COUNT(*) DESC
--      LIMIT 6;

-- --                         *INSERT CHALLENGES*

-- -- Bronze #1               *DONE*

-- insert into Track (Name, AlbumId, MediaTypeId , GenreId, Composer, Milliseconds, Bytes, UnitPrice) 
--      values
--      ("The Electric Co.", 150, 2, 1, "U2", 513000, 1234, 0.99),
--      ("Another Time, Another Place", 150, 2, 1, "U2", 513000, 1234, 0.99),
--      ("A Day Without Me", 150, 2, 1, "U2", 513000, 1234, 0.99),
--      ("The Ocean", 150, 2, 1, "U2", 513000, 1234, 0.99),
--      ("Stories for Boys", 150, 2, 1, "U2", 513000, 1234, 0.99),
--      ("Out of Control", 150, 2, 1, "U2", 513000, 1234, 0.99),
--      ("Into the Heart", 150, 2, 1, "U2", 513000, 1234, 0.99),
--      ("An Cat Dubh", 150, 2, 1, "U2", 513000, 1234, 0.99);

-- -- Silver #1               *DONE*

-- -- BEFORE
-- -- Insert into Track (Name, AlbumId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
-- --   values("Extra Track", 348, 1, "U2", 290000, 1234, 0.99);


-- -- AFTER
-- Insert into Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
--      values("Extra Track", 150, 2, 1, "U2", 290000, 1234, 0.99);

-- -- GOLD #1                 *DONE*

-- INSERT into Track (Name, AlbumId, MediaTypeId, GenreId, Composer, Milliseconds, Bytes, UnitPrice)
-- VALUES
--      ("I Will Follow", 150, 2, 1, "U2", 290000, 1234, 0.99),
--      ("Twilight", 150, 2, 1, "U2", 290000, 1234, 0.99);


-- --                         *DELETE CHALLENGES*

-- -- Bronze #1               *DONE*

-- SELECT TrackId FROM Track WHERE Milliseconds > 5000000;

-- -- Bronze #2               *DONE*

-- SELECT * FROM PlaylistTrack WHERE TrackId in (2820, 3224);

-- -- Bronze #3               *DONE*

-- SELECT * FROM InvoiceLine WHERE TrackId in (2820, 3224);

-- -- Silver #1               *DONE*

-- DELETE FROM Track WHERE Track.Milliseconds > 5000000;

-- -- Silver #2               *DONE*

-- DELETE FROM PlaylistTrack WHERE TrackId in (2820, 3224);
-- DELETE FROM InvoiceLine WHERE TrackId in (2820,3224);

-- -- Silver #3               *DONE*

-- DELETE FROM Track
--   WHERE Track.AlbumId in
--         (SELECT Album.AlbumId FROM Album WHERE Title = "Boy")