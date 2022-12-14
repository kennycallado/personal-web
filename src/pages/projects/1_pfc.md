---
layout: ../../layouts/projects/Show.astro
title: Sensacion
description: Proyecto full stack que incluye algunas de las tecnologías más innovadoras.
icon: ion:restaurant-outline
---

<script src="https://code.iconify.design/iconify-icon/1.0.0-beta.3/iconify-icon.min.js"></script>

# sensacion

![image-1](/projects/pfc/image-1.png)

> Captura de la demo en funcionamiento: [sensacion](https://sensacion.kennycallado.dev)

## Preámbulo

**_Sensacion_** es el nombre de un restaurante ficticio. Este proyecto describe la creación de una sencilla aplicación web _full-stack_ para este restaurante. Integrando los siguientes módulos:

- Interfaz de usuario
- Api conexión con el servidor
- Conexión con base de datos
- Despliegue sobre kubernetes

También se incluye la memoria del proyecto así como otros elementos, ya que es el proyecto final de ciclo que presenté para el curso de DAW. En dicha memoria y en su presentación se cita el estado previo del proyecto, siendo este una web estática sencilla, que incluye bootstrap para los estilos, y que realicé previamente para una asignatura. Desde este punto se ha generado todo el resto de infraestructura, formando una aplicación interactiva y funcional que permite a los usuarios informarse sobre el restaurante y realizar reservas.

El repositorio de código está alojado en github. Puedes acceder al directorio principal desde el siguiente [enlace](https://github.com/kennycallado/PFC-root).

Para este proyecto se han usado las siguientes tecnologías:

### Front-end

<div class="md:w-9/12 mx-auto flex justify-between">
  <div class="flex flex-col">
    <iconify-icon class="text-6xl" icon="vscode-icons:file-type-html"></iconify-icon>
    <span class="hidden md:block text-center">HTML</span>
  </div>
  <div class="flex flex-col">
    <iconify-icon class="text-6xl" icon="vscode-icons:file-type-css"></iconify-icon>
    <span class="hidden md:block text-center">CSS</span>
  </div>
  <div class="flex flex-col">
    <iconify-icon class="text-6xl" icon="logos:angular-icon"></iconify-icon>
    <span class="hidden md:block text-center">Angular</span>
  </div>
  <div class="flex flex-col">
    <iconify-icon class="text-6xl" icon="logos:bootstrap"></iconify-icon>
    <span class="hidden md:block text-center">Bootstrap</span>
  </div>
  <div class="flex flex-col">
    <iconify-icon class="text-6xl" icon="logos:docker-icon"></iconify-icon>
    <span class="hidden md:block text-center">Docker</span>
  </div>
</div>
  
### Back-end

<div class="md:w-9/12 mx-auto flex justify-between">
  <div class="flex flex-col">
    <iconify-icon class="text-6xl" icon="logos:rust"></iconify-icon>
    <span class="hidden md:block text-center">Rust</span>
  </div>
  <div class="flex flex-col">
    <iconify-icon class="text-6xl" icon="openmoji:rocket"></iconify-icon>
    <span class="hidden md:block text-center">Rocket</span>
  </div>
  <div class="flex flex-col">
    <iconify-icon class="text-6xl" icon="logos:docker-icon"></iconify-icon>
    <span class="hidden md:block text-center">Docker</span>
  </div>
  <div class="flex flex-col">
    <iconify-icon class="text-6xl" icon="logos:postgresql"></iconify-icon>
    <span class="hidden md:block text-center">Postgres</span>
  </div>
  <div class="flex flex-col">
    <iconify-icon class="text-6xl" icon="logos:kubernetes"></iconify-icon>
    <span class="hidden md:block text-center">k8s</span>
  </div>
</div>

---

## Interfaz

En la raíz se puede observar la estructura de directorios típica de un sitio web estático, sin embargo, el directorio `angular` contiene una sección del sitio que incluye este framework para generar un entorno dinámico e interactivo, donde el usuario podrá consultar la disponibilidad e incluso realizar reservas.

![image-2](/projects/pfc/image-2.png)

---

## Servidor

He usado el lenguaje de programación _Rust_ para crear el _back-end_. Es un lenguaje compilado el cual genera un binario que se ejecutará en el servidor. Sobre este lenguaje he usado el web framework _Rocket_. Este framework resulta muy sencillo una vez que conoces un poco el lenguaje y el rendimiento es impresionante. En algunas comparativas exponen que _express.js_ devuelve 22000 respuestas por segundo mientras que _rocker_ puede devolver hasta 70000 respuestas.

Para la conexión con la base de datos y las consultas a esta he usado la librería _Diesel_. Esta ha sido una de las partes más complejas por lo diferente que es este _ORM_ en comparación con el resto. En realidad está más orientado a ser un _query builder,_ por lo que ha sido un pequeño cambio de paradigma acostumbrado a realizar las consultas manualmente o usando soluciones tipo _Doctrine_ para _php_.

![image-3](/projects/pfc/image-3.png)

---

## Otros

Ambos módulos de la aplicación incluyen un `Dockerfile` que sirve para generar la imagen de docker que será usada en producción. Para la interfaz he usado una imagen base con _nginx_, que sirve las páginas estáticas así como el build de angular para una ruta concreta. Por otro lado he usado una imagen de _busybox_ para el servidor, esta imagen es mucho más ligera y contiene todo lo necesario para ejecutar el servidor.

Sobre esta segunda parte destacar que he tenido en cuenta muchas consideraciones específicas ya que la idea es desplegar la aplicación sobre una _raspberry pi_ y no sobre un servidor de cloud. Las cuestiones más importantes han sido la arquitectura _arm64_ del hardware donde se ejecutará y la imagen usada sin librerías libc requeridas por el framework. Más [detalles](https://github.com/kennycallado/PFC-server/tree/4bac75490841cd5f4427724f52cd878780f33c06) en el README del repositorio.

![image-4](/projects/pfc/image-4.png)

---

## Despliegue

Como resultado se ha generado una imagen de _docker_ para la interfaz de usuario y otra imagen para el servidor de comunicación con la base de datos. Estas imágenes se distribuyen públicamente gracias al servicio de [docker hub](https://hub.docker.com). Y finalmente la aplicación es desplegada sobre un servidor de _kubernetes_ instalado en una _raspberry pi_. _Kubernetes_ obtiene dichas imágenes y las provee de los recursos necesarios para que la aplicación en su conjunto funcione correctamente.

![image-5](/projects/pfc/image-5.png)

---

## Conclusión

Este proyecto me ha servido para experimentar muchas tecnologías muy actuales, alcanzando un rendimiento y seguridad muy altos gracias al uso de _Rust_ y sobre todo he aprendido mucho, tanto de las tecnologías como del desarrollo web y de las infraestructuras para contenedores.

<a href="/projects">Volver</a>
