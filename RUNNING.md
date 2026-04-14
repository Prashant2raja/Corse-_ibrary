# Running Course Library

## Windows PowerShell

From the project folder:

```powershell
.\mvnw.cmd spring-boot:run
```

Then open:

- `http://localhost:8080`
- `http://localhost:8080/h2-console`

## Build a jar

```powershell
.\mvnw.cmd clean package
java -jar target\courselibrary-0.0.1-SNAPSHOT.jar
```

## VS Code

This project includes:

- `.vscode/tasks.json` for Maven run and package tasks
- `.vscode/launch.json` to run through Maven instead of the raw Java launcher
