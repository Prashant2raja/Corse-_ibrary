# Course Library

A Spring Boot web application for managing a small course or book library. The project lets you create, view, update, and delete books, authors, categories, and publishers through server-rendered HTML pages.

## Overview

This project is a **Java Spring Boot CRUD application** built with:

- **Spring Boot** for application setup and web runtime
- **Spring MVC** for request handling and page navigation
- **Spring Data JPA** for database access
- **Thymeleaf** for server-side HTML templates
- **H2 Database** as the in-memory database used during development
- **Maven** for build and dependency management
- **Lombok** to reduce boilerplate in entity classes

## What This Project Does

The application manages library-style data across four main modules:

- **Books**
- **Authors**
- **Categories**
- **Publishers**

You can:

- list records
- open details for a book
- create new records
- update existing records
- delete records
- connect books with authors, categories, and publishers

The app also inserts a few sample books automatically when it starts through a `CommandLineRunner` in the main application class.

## Project Type

This is a **monolithic Spring Boot MVC web application**.

It is **not a pure REST API project** because the controllers return Thymeleaf view names such as `books`, `authors`, and `update-book` instead of returning JSON responses with `@RestController`.

So the project is best described as:

- **Server-side rendered web application**
- **CRUD application**
- **Spring MVC + Thymeleaf + JPA project**

## Tech Stack

| Layer | Technology |
| --- | --- |
| Language | Java 11 |
| Framework | Spring Boot 2.5.4 |
| Web | Spring MVC |
| View Engine | Thymeleaf |
| Persistence | Spring Data JPA |
| Database | H2 in-memory database |
| Build Tool | Maven |
| Boilerplate Reduction | Lombok |
| Testing | Spring Boot Test, JUnit 5 |

## Database Used

The application uses **H2**, which is a lightweight in-memory relational database.

Configuration from `src/main/resources/application.properties`:

```properties
spring.h2.console.enabled=true
spring.datasource.platform=h2
spring.datasource.url=jdbc:h2:mem:course-library-management-system;MV_STORE=false
spring.jpa.hibernate.ddl-auto=update
```

### What this means

- The database runs in memory while the application is running.
- Data is usually lost when the application stops.
- The schema is managed automatically by JPA and Hibernate.
- The H2 console is enabled for database inspection.

## Architecture

The project follows a common layered Spring Boot structure:

```text
Client (Browser)
    -> Controller layer
    -> Service layer
    -> Repository layer
    -> H2 Database
```

### Layer explanation

- **Controller layer** handles HTTP requests and returns HTML views.
- **Service layer** contains business logic and delegates to repositories.
- **Repository layer** talks to the database using Spring Data JPA.
- **Entity layer** maps Java classes to database tables.
- **Templates** render the UI using Thymeleaf.

## Folder Structure

```text
Corse-_ibrary-main/
|-- .mvn/
|   `-- wrapper/
|       `-- maven-wrapper.properties
|-- .vscode/
|   |-- launch.json
|   `-- tasks.json
|-- src/
|   |-- main/
|   |   |-- java/
|   |   |   `-- com/application/courselibrary/
|   |   |       |-- controller/
|   |   |       |   |-- AuthorController.java
|   |   |       |   |-- BookController.java
|   |   |       |   |-- CategoryController.java
|   |   |       |   |-- IndexController.java
|   |   |       |   `-- PublisherController.java
|   |   |       |-- entity/
|   |   |       |   |-- Author.java
|   |   |       |   |-- Book.java
|   |   |       |   |-- Category.java
|   |   |       |   `-- Publisher.java
|   |   |       |-- repository/
|   |   |       |   |-- AuthorRepository.java
|   |   |       |   |-- BookRepository.java
|   |   |       |   |-- CategoryRepository.java
|   |   |       |   `-- PublisherRepository.java
|   |   |       |-- service/
|   |   |       |   |-- AuthorService.java
|   |   |       |   |-- BookService.java
|   |   |       |   |-- CategoryService.java
|   |   |       |   `-- PublisherService.java
|   |   |       `-- CourselibraryApplication.java
|   |   `-- resources/
|   |       |-- application.properties
|   |       `-- templates/
|   |           |-- add-author.html
|   |           |-- add-book.html
|   |           |-- add-category.html
|   |           |-- add-publisher.html
|   |           |-- authors.html
|   |           |-- books.html
|   |           |-- categories.html
|   |           |-- index.html
|   |           |-- list-book.html
|   |           |-- publishers.html
|   |           |-- update-author.html
|   |           |-- update-book.html
|   |           |-- update-category.html
|   |           |-- update-publisher.html
|   |           `-- fragments/
|   |               `-- header.html
|   `-- test/
|       `-- java/com/application/courselibrary/
|           `-- CourselibraryApplicationTests.java
|-- mvnw
|-- mvnw.cmd
|-- pom.xml
|-- RUNNING.md
`-- README.md
```

## What Each Folder Does

### `src/main/java/com/application/courselibrary/controller`
Contains MVC controllers that receive browser requests and return view names.

### `src/main/java/com/application/courselibrary/service`
Contains business logic methods like create, update, delete, and fetch operations.

### `src/main/java/com/application/courselibrary/repository`
Contains JPA repository interfaces used to access the database.

### `src/main/java/com/application/courselibrary/entity`
Contains entity classes that represent database tables and relationships.

### `src/main/resources/templates`
Contains Thymeleaf HTML pages rendered by the controllers.

### `src/main/resources/application.properties`
Contains runtime configuration such as database URL and H2 console settings.

### `src/test`
Contains tests for the Spring Boot application.

## Data Model

The application works with four main entities:

### `Book`
Fields:

- `id`
- `isbn`
- `name`
- `description`
- `authors`
- `categories`
- `publishers`

### `Author`
Fields:

- `id`
- `name`
- `description`
- `books`

### `Category`
Fields:

- `id`
- `name`
- `books`

### `Publisher`
Fields:

- `id`
- `name`
- `books`

### Relationships

- One book can have many authors.
- One book can have many categories.
- One book can have many publishers.
- These relationships are implemented as **many-to-many** associations.

## HTTP Routes and API Style

Even though this is not a REST API project, it still uses HTTP endpoints. These are mainly MVC routes that return HTML pages.

### Home

| Method | Route | Purpose |
| --- | --- | --- |
| GET | `/` | Open the home page |

### Book Routes

| Method | Route | Purpose | API Style |
| --- | --- | --- | --- |
| GET | `/books` | List all books | Read |
| GET | `/book/{id}` | View one book | Read |
| GET | `/add-book` | Open create book form | Form page |
| POST | `/save-book` | Create a new book | Create |
| GET | `/update-book/{id}` | Open update form | Form page |
| POST | `/save-update/{id}` | Update an existing book | Update |
| GET | `/remove-book/{id}` | Delete a book | Delete action |

### Author Routes

| Method | Route | Purpose | API Style |
| --- | --- | --- | --- |
| GET | `/authors` | List all authors | Read |
| GET | `/add-author` | Open create author form | Form page |
| POST | `/save-author` | Create author | Create |
| GET | `/update-author/{id}` | Open update form | Form page |
| POST | `/update-author/{id}` | Update author | Update |
| GET | `/remove-author/{id}` | Delete author | Delete action |

### Category Routes

| Method | Route | Purpose | API Style |
| --- | --- | --- | --- |
| GET | `/categories` | List all categories | Read |
| GET | `/add-category` | Open create category form | Form page |
| POST | `/save-category` | Create category | Create |
| GET | `/update-category/{id}` | Open update form | Form page |
| POST | `/update-category/{id}` | Update category | Update |
| GET | `/remove-category/{id}` | Delete category | Delete action |

### Publisher Routes

| Method | Route | Purpose | API Style |
| --- | --- | --- | --- |
| GET | `/publishers` | List all publishers | Read |
| GET | `/add-publisher` | Open create publisher form | Form page |
| POST | `/save-publisher` | Create publisher | Create |
| GET | `/update-publisher/{id}` | Open update form | Form page |
| POST | `/update-publisher/{id}` | Update publisher | Update |
| GET | `/remove-publisher/{id}` | Delete publisher | Delete action |

## Are These GET, POST, PUT, or DELETE APIs?

This project mainly uses **GET** and **POST**.

### GET endpoints
Used for:

- loading pages
- listing data
- viewing item details
- opening create and update forms
- delete actions in this project

Examples:

- `GET /books`
- `GET /authors`
- `GET /update-book/{id}`
- `GET /remove-book/{id}`

### POST endpoints
Used for:

- saving new records
- updating existing records submitted from forms

Examples:

- `POST /save-book`
- `POST /save-author`
- `POST /update-category/{id}`
- `POST /update-publisher/{id}`

### PUT and DELETE
The project does **not** currently expose real `PUT` or `DELETE` endpoints.

In a pure REST API design, updates would usually use `PUT` and deletes would use `DELETE`. Here, updates are implemented with `POST`, and deletes are triggered through `GET` routes from the UI.

## How to Run the Project

### Prerequisites

- Java 11 or later installed
- Internet connection the first time if Maven wrapper needs to download dependencies

### Run with Maven Wrapper on Windows

```powershell
cd C:\Users\rajan\OneDrive\Desktop\Projects\Corse-_ibrary-main
.\mvnw.cmd spring-boot:run
```

Then open:

- `http://localhost:8080`
- `http://localhost:8080/h2-console`

### Build and run the jar

```powershell
.\mvnw.cmd clean package
java -jar target\courselibrary-0.0.1-SNAPSHOT.jar
```

## How to Test the Project

### 1. Test in the browser

This is the main way to test the app because it is a Thymeleaf MVC project.

Open these pages in your browser:

- `http://localhost:8080/`
- `http://localhost:8080/books`
- `http://localhost:8080/authors`
- `http://localhost:8080/categories`
- `http://localhost:8080/publishers`

Then verify that you can:

- create new records
- update existing records
- delete records
- view book details

### 2. Test the database using H2 Console

Open:

- `http://localhost:8080/h2-console`

Use the JDBC URL:

```text
jdbc:h2:mem:course-library-management-system
```

You can inspect tables such as:

- `books`
- `authors`
- `categories`
- `publishers`
- join tables for many-to-many relationships

### 3. Run automated tests

```powershell
.\mvnw.cmd test
```

Current test coverage is minimal and mainly checks whether the Spring application context loads successfully.

### 4. Test endpoints with Postman

Because these routes are form-based MVC routes, Postman is less useful than a browser, but you can still test request methods.

Examples:

- `GET http://localhost:8080/books`
- `GET http://localhost:8080/authors`
- `POST http://localhost:8080/save-author`
- `POST http://localhost:8080/save-category`

For `POST` requests, send form fields using `x-www-form-urlencoded` or form-data.

## APIs and Libraries Used

Main dependencies from `pom.xml`:

- `spring-boot-starter-web`
- `spring-boot-starter-thymeleaf`
- `spring-boot-starter-data-jpa`
- `h2`
- `lombok`
- `spring-boot-starter-test`

## Sample Workflow

A typical user flow looks like this:

1. Open the home page.
2. Navigate to books, authors, categories, or publishers.
3. Add a new record using a form.
4. Save the record with a POST request.
5. Edit or remove records later.
6. View persisted data in the browser or H2 console.

## Common Interview or Viva Questions

### 1. What type of project is this?
This is a Spring Boot MVC CRUD web application using Thymeleaf and Spring Data JPA.

### 2. Is this a REST API project?
No. It uses HTTP endpoints, but the controllers return HTML templates instead of JSON responses.

### 3. Which database is used?
H2 in-memory database.

### 4. What does JPA do here?
JPA maps Java entity classes to database tables and handles persistence through repositories.

### 5. What is Thymeleaf used for?
Thymeleaf renders dynamic HTML pages on the server side.

### 6. What are the main modules?
Books, Authors, Categories, and Publishers.

### 7. Which HTTP methods are used?
Mostly GET and POST.

### 8. Why is Lombok used?
Lombok reduces boilerplate code like getters, setters, and constructors.

### 9. What relationships exist in the database?
Books have many-to-many relationships with authors, categories, and publishers.

### 10. What happens when the app starts?
Sample data is created using a `CommandLineRunner` in the main application class.

## Possible Improvements

- convert selected routes into proper REST endpoints with `@RestController`
- use `PUT` and `DELETE` for update and delete operations
- add validation annotations on entity fields
- add more unit and integration tests
- improve exception handling and error pages
- add pagination and search
- use a persistent database like MySQL or PostgreSQL for production use
- secure the application with Spring Security

## Notes

- This project is well suited for learning Spring Boot MVC, JPA relationships, form handling, and CRUD operations.
- Since H2 is in-memory, production deployment would typically require a persistent database.
- The GitHub README is designed to help reviewers, recruiters, teachers, and teammates quickly understand the project.

