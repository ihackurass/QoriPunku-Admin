# QoriPunku Admin

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Status](https://img.shields.io/badge/Estado-Funcional-brightgreen.svg)]()

## Visión General

**QoriPunku Admin** es la aplicación de administración remota que complementa al sistema de control de acceso QoriPunku (SecureGate). Esta herramienta permite gestionar ciertos aspectos del sistema desde cualquier dispositivo, ofreciendo una interfaz intuitiva para monitorear visitantes, controlar permisos de acceso y configurar parámetros del sistema.

## Características Principales

- **Historial de Visitantes**: Visualización y gestión de fotografías capturadas durante intentos de acceso
- **Control de Accesos**: Administración de permisos para tarjetas RFID registradas en el sistema
- **Configuración Remota**: Actualización de parámetros críticos sin necesidad de acceder físicamente al sistema
- **Interfaz Intuitiva**: Diseño amigable y responsivo para facilitar la administración

## Tecnologías Utilizadas

<div align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"/>
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart"/>
  <img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP"/>
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white" alt="MySQL"/>
</div>

## Interfaz Principal

QoriPunku Admin cuenta con una interfaz moderna que facilita la gestión del sistema de control de acceso:

<div align="center">
  <img src="Capturas/dashboard.jpeg" alt="Dashboard Principal" width="40%"/>
</div>

## Funcionalidades Detalladas

### Control De Accesos

Permite visualizar todas las fotografías capturadas por el sistema QoriPunku durante intentos de acceso no autorizados.

- **Gestión de Registros**: Posibilidad de eliminar fotografías y registros no necesarios

<div align="center">
  <img src="Capturas/historial.png" width="45%" alt="Vista de Historial" />
</div>

### Control de UUIDS

Administra los permisos de las tarjetas RFID registradas en la base de datos del sistema.

- **Listado de Tarjetas**: Visualización de todas las tarjetas RFID registradas
- **Gestión de Permisos**: Otorgar o revocar acceso a tarjetas específicas

<div align="center">
  <img src="Capturas/uuids.jpeg" width="45%" alt="Lista de Tarjetas" />
</div>

### Configuración del Sistema

Permite modificar parámetros críticos del sistema QoriPunku sin necesidad de acceso físico.

- **Gestión de Administradores**: Actualización del número telefónico para notificaciones por WhatsApp
- **Seguridad**: Cambio de contraseña para acceso al panel de configuración físico

<div align="center">
  <img src="Capturas/configuracion.jpeg" width="45%" alt="Configuración General" />
</div>

## Arquitectura de la Aplicación

QoriPunku Admin sigue una arquitectura cliente-servidor:

- **Cliente Flutter**: Aplicación multiplataforma desarrollada con Flutter
- **Backend PHP**: API RESTFUL para la comunicación con la base de datos
- **Base de Datos MySQL**: Almacenamiento centralizado compartido con el sistema principal QoriPunku

La aplicación se comunica con el mismo servidor que utiliza el sistema QoriPunku, accediendo a la misma base de datos para mantener la coherencia de la información.

## Instalación

1. **Requisitos Previos**
   - Aplicación testeada en Android 12
   - Conexión a internet activa
   - Sistema QoriPunku correctamente configurado y operativo

2. **Configuración Inicial**
   - Descargar el codigo fuente de `App/`
   - Modficar la url y colocar el tuyo en `lib/config.dart` 
   - Compilarlo usando tu IDE preferido
   - Verificar la conectividad con el sistema
    
3. **Instalación de la Aplicación**
   - Permitir la instalación desde fuentes desconocidas en el dispositivo
   - Ingresar las credenciales de administrador (usuario: admin, contraseña: 1234)



## Flujo de Trabajo

1. **Monitoreo de Accesos**
   - El administrador puede revisar las fotografías en cualquier momento
   - Se puede eliminar fotografías obsoletas o innecesarias

2. **Gestión de Permisos**
   - Revisar la lista de tarjetas RFID registradas
   - Activar o desactivar permisos para tarjetas específicas
   - Las modificaciones surten efecto inmediatamente en el sistema

3. **Actualización de Configuraciones**
   - Modificar parámetros según necesidades cambiantes
   - Los cambios se sincronizan automáticamente con el sistema QoriPunku

## Licencia

Este proyecto está bajo la Licencia MIT - consulta el archivo [LICENSE](LICENSE.md) para más detalles.

## Contacto

Si tienes preguntas o sugerencias, no dudes en contactarme :)

---

<div align="center">
  <sub>Desarrollado con orgullo en Perú, complementando al sistema QoriPunku.</sub>
</div>
