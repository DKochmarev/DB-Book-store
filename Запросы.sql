-- 1. Список книг с ценой выше 300
SELECT Title, Price FROM Books
WHERE Price > 300;

-- 2. Список клиентов, оформивших заказ на книгу "Преступление и наказание"
SELECT FirstName, LastName FROM Employees
WHERE Client_id IN (SELECT Client_id FROM Orders WHERE Book_id = 7);

-- 3. Список книг, проданных сотрудником с фамилией "Петров"
SELECT Title FROM Books
WHERE Book_id IN (SELECT Book_id FROM Orders WHERE Employee_id = 2);

-- 4. Список клиентов, заказавших более одной книги
SELECT FirstName, LastName FROM Client
WHERE Client_id IN (SELECT DISTINCT Client_id FROM Orders);

-- 5. Список книг, заказанных клиентом с фамилией "Морозова"
SELECT Title FROM Books
WHERE Book_id IN (SELECT Book_id FROM Orders WHERE Client_id = 1);

-- 6. Список сотрудников с зарплатой выше 40000
SELECT FirstName, LastName FROM Employees
WHERE Salary > 40000;

-- 7. Список книг, опубликованных до 1800 года
SELECT Title FROM Books
WHERE PublicationDate < 1800;

-- 8. Общая сумма заказов, оформленных в мае 2024 года
SELECT SUM(Price * Count) FROM Orders
WHERE Date BETWEEN '2024-05-01' AND '2024-05-31';

-- 9. Список авторов, написавших книги, опубликованные издательством "АСТ"
SELECT FirstName, SecondName FROM Authors
WHERE Author_id IN
    (SELECT Author_id FROM Books WHERE Publisher = 'АСТ');

-- 10. Список книг с наибольшим количеством заказов:
SELECT Title, COUNT(*) AS OrderCount FROM Books
JOIN Orders ON Books.Book_id = Orders.Book_id
GROUP BY Title
ORDER BY OrderCount DESC;
