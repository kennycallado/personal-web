---
layout: ../../layouts/projects/Show.astro
title: Concept blog
description: Prueba de concepto, blog en php contenerizado y funcionando en Heroku.
icon: file-icons:php
---

# Concept blog

![image-1](/projects/blog-php/image-1.png)

> Captura de la demo en funcionamiento: [Concpet blog](https://morning-mountain-45619.herokuapp.com/)

## Preámbulo

Prueba de concepto de la implementación de un blog en _php_. Sigue el patrón _Modelo Vista Controlador_ para la organizar el código y el núcleo desarrollado durante el curso de _DAW_. Incluye algunas características para el despliegue íntegro sobre la plataforma _Heroku_, mientras que no se ha tenido en consideración los estilos de la interfaz de usuario.

El repositorio de código está alojado en github. Puedes acceder al directorio principal desde el siguiente [enlace](https://github.com/kennycallado/jubilant-octo-winner).

## Servidor

La aplicación está desarrollada en _php_, haciendo uso de algunas de las características de la versión 8.0. He usado _composer_ para gestionar los _namespaces_ de la aplicación. Esto habilita el autolad, facilitando inyectar la dependencias donde son requeridas en el código.

### Core

Es el núcleo de la aplicación, su función es recibir las peticiones que llegan al servidor y a través de una serie de métodos, determinar la ruta donde debe llegar estas y proveer al método de los parámetros o el body, en caso de que lleguen con la petición. También se encuentran la clase y métodos de consulta a la base de datos.

### MVC

El proyecto sigue el patrón de diseño _Modelo Vista Controlador_, esto facilita enormemente el desarrollo y mantenimiento de la aplicación, ya que cada apartado de esta se localiza en un directorio concreto. Este patrón está muy extendido y la mayoría de los frameworks lo implementa por su sencillez.

Con este patrón el _core_ se encarga de determinar el _controlador_ que debe ejecutarse. Por su lado, el _controlador_ se encarga de ejecutar el _modelo_ para obtener los datos y contestar a la petición ejecutando de la _vista_ apropiada.

## Base de datos

He configurado la aplicación para usar una base de datos gratuita que ofrece _Heroku_. Para ello es importante recibir correctamente la url a la que se debe conectar usando variables de entorno, ya que las credenciales de conexión pueden variar continuamente. El administrador de base de datos es _postgresql_ por lo que he usado _pdo_ para realizar las consultas.

## Contenedores

Se incluye un fichero `Dockerfile` que permite generar la imagen de docker que será desplegada en producción. He usado una imagen base de _php_ con _apache_ y un fichero `.htaccess` para configurar este último.

Heroku ofrece dyno como solución de contenedores, esta capa de abstracción facilita a los desarrolladores el despliegue sobre la plataforma, sin embargo también ofrece la posibilidad de desplegar usando docker. Esta última opción es la que he implementado para desacoplar la aplicación de la plataforma y con este objetivo el fichero `heroku.yml` permite informar a la plataforma sobre los recursos requeridos, como si de un manifiesto de _kubernetes_ se tratase.

## Despliegue

La plataforma permite conectar a través de _webhook_ con un repositorio de _github_ y con ello cada vez que se realiza una acción _push_ sobre este el webhook inicia la construcción y despliegue de la nueva imagen de la aplicación. Esto facilita mucho el trabajo de _ci/cd_ y para soluciones monolíticas pequeñas es muy recomendable.

## Conclusión

A pesar de ser un proyecto muy sencillo y no implementar una interfaz de usuario con estilos, a nivel de código es un buen ejemplo para aprender las bases del desarrollo web. Con ella aprendí mucho sobre el manejo de las peticiones y el enrutamiento de estas, estructurar el código con _MVC_, pero sobre todo aprendí a configurar el proyecto para desplegarlo sobre una plataforma de cloud usando docker y webhooks.

<a href="/projects">Volver</a>
