# Api Rest real-state-app
## Descripción
Esta aplicación web permite gestionar el alquiler y venta de inmuebles, ofreciendo funcionalidades como:
* **CRUD:** Crear, leer, actualizar y eliminar propiedades.
* **Relaciones:** Gestión de relaciones entre propiedades, usuarios y otras entidades.
* **Subida de imágenes:** Almacenamiento de imágenes de propiedades en Cloudinary.
* **Autenticación:** Registro y autenticación de usuarios mediante JWT.
* **Autorización:** Control de acceso a recursos basado en roles.
* **Paginación:** Mostrando resultados de búsqueda de forma paginada.

## Requisitos
* **Servidor:** PHP >= 8.1
* **Base de datos:** MySQL (o compatible)
* **Herramientas:**
  * Composer: Para gestionar dependencias.
  * Git: Para el control de versiones.

### Tecnologías empleadas
- Symfony
- MySQL

### Requisitos
- PHP >= 8.1
- MySQL (Maria DB)
- Symfony CLI 
- GIT

### Instalación
1. Clone el repositorio

```bash 
git clone https://github.com/Yeyoramirez17/api-rest-real-state-app.git
```

2. Instalar las dependencias

```bash 
composer install
```

3. Cree la base de datos
```bash 
CREATE DATABASE IF NOT EXISTS db_real_state;
```

4. Migra las migraciones, opcional inserte los registros semillas (Son de prueba)
```bash 
symfony console doctrine:migrations:migrate 
symfony console doctrine:fixture:load
```

5. Ejecute el servidor de manera local
```bash
symfony local:server:start --port=8081
```

[![Symfony Logo](https://symfony.com/images/opengraph/symfony.png)](https://symfony.com/)