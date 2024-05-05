CREATE TABLE Books (
        Book_id int NOT NULL PRIMARY KEY,
        Title varchar(255) NOT NULL,
        Author_id int NOT NULL,
        PublicationDate date NOT NULL,
        Publisher varchar(255) NOT NULL,
        Price decimal(10,2) NOT NULL,
        FOREIGN KEY (Author_id) REFERENCES Authors (Author_id)
);

CREATE TABLE Authors (
        Author_id int NOT NULL PRIMARY KEY,
        FirstName varchar(50) NOT NULL,
        SecondName varchar(50) NOT NULL,
        Country varchar(50) NOT NULL
);

CREATE TABLE Employees (
        Employee_id int NOT NULL PRIMARY KEY,
        FirstName varchar(50) NOT NULL,
        SecondName varchar(50) NOT NULL,
        Salary decimal(10,2) NOT NULL,
        Position varchar(255) NOT NULL,
        PhoneNumber varchar(20) NOT NULL
);

CREATE TABLE Orders (
        Book_id int NOT NULL,
        Order_id int NOT NULL,
        Date date NOT NULL,
        Client_id int NOT NULL,
        Employee_id int NOT NULL,
        Price decimal(10,2) NOT NULL,
        Count int NOT NULL
        FOREIGN KEY (Book_id) REFERENCES Books (Book_id)
        FOREIGN KEY (Client_id) REFERENCES Client (Client_id)
        FOREIGN KEY (Employee_id) REFERENCES Employees (Employee_id)
);

CREATE TABLE Client (
        Client_id int NOT NULL PRIMARY KEY,
        FirstName varchar(50) NOT NULL,
        SecondName varchar(50) NOT NULL,
        Address varchar(255) NOT NULL,
        PhoneNumber varchar(20) NOT NULL
);

CREATE TABLE EmployeeHistory (
        Employee_id int NOT NULL,
        Time_start time NOT NULL,
        Time_end time NOT NULL,
        Salary int NOT NULL,
        Position varchar(20) NOT NULL,
        Action varchar(255) NOT NULL
        FOREIGN KEY (Employee_id) REFERENCES Employees (Employee_id)
        CHECK (Time_start <= Time_end)
);