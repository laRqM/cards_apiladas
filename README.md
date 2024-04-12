# Proyecto de tarjetas apiladas
Este es un fork del proyecto [flutter_projects](https://github.com/brocodev/flutter_projects) de [Kevin Melendez](https://github.com/brocodev). Se trata de un simple proyecto académico.
## Backend
Este fork utiliza un backend en AWS con una función Lambda, API Gateway y DynamoDB para almacenar los datos.
## Variables de entorno
En la raíz del proyecto debemos crear una carpeta llamada `assets` y dentro debemos crear un archivo llamado `.env`. Dentro de este colocamos:
> - baseUrlPersona=TU_URL
> - baseUrlPersonas=TU_URL

Donde `baseUrlPersona` será un endpoint para un recurso en API Gateway que contenga los métodos `GET`, `DELETE`, `POST` y `PATCH`.
Para `baseUrlPersonas`, solo necesitamos que el recurso tenga el método `GET`, pues este endpoint está pensando para llamar a todos los datos en la base de datos. Mientras que `baseUrlPersona` es para cada uno de esos datos.
## UI
 | Home Screen | Add Screen |
 |-----------|-----------|
 |<img src="home_screen.gif" width="250" >|<img src="add_screen.gif" width="250"> |

 > Los datos mostrados en la aplicación son completamente ficticios