# Sistema de Control de Asistencia con Huellas Digitales

## JAR Ejecutable Generado

El archivo JAR ejecutable está ubicado en:
```
netbeans_sample\dist\FDxSDKPro.jar
```

## Requisitos del Sistema

### Software Requerido
- **Java Runtime Environment (JRE) 8 o superior**
  - Para verificar: `java -version` en la línea de comandos
  - Descargar desde: https://www.oracle.com/java/technologies/downloads/

### Hardware Requerido
- **Lector de Huellas SecuGen**
  - Modelos compatibles: Hamster Pro, Hamster IV, Hamster Plus, etc.
  - El dispositivo debe estar conectado vía USB

### Conectividad
- **Acceso a Base de Datos MariaDB**
  - Servidor: 212.104.172.216:13306
  - Base de datos: mb_recursos_humanos
  - Las credenciales están configuradas en el código

## Cómo Ejecutar la Aplicación

### Método 1: Script Automático (Recomendado)
Simplemente ejecuta el archivo batch:
```
ejecutar_aplicacion.bat
```

Este script:
- Detecta automáticamente si tu sistema es de 32-bit o 64-bit
- Configura las librerías DLL nativas necesarias
- Ejecuta la aplicación

### Método 2: Línea de Comandos Manual

#### Para Sistemas de 64 bits:
```batch
set PATH=%CD%\jnisgfplib\x64;%PATH%
cd netbeans_sample\dist
java -jar FDxSDKPro.jar
```

#### Para Sistemas de 32 bits:
```batch
set PATH=%CD%\jnisgfplib\win32;%PATH%
cd netbeans_sample\dist
java -jar FDxSDKPro.jar
```

## Estructura del Proyecto

```
FDx SDK Pro for Java v1.12/
│
├── ejecutar_aplicacion.bat          # Script para ejecutar fácilmente
├── INSTRUCCIONES.md                 # Este archivo
│
├── netbeans_sample/
│   └── dist/
│       ├── FDxSDKPro.jar           # JAR ejecutable principal
│       └── lib/                     # Librerías dependencias
│           ├── AbsoluteLayout.jar
│           ├── FDxSDKPro.jar       # SDK de huellas
│           ├── mariadb-java-client-3.5.6.jar
│           ├── mysql-connector-j-8.0.33.jar
│           ├── json-20231013.jar
│           └── webp-imageio-0.2.0.jar
│
└── jnisgfplib/                      # Librerías nativas (DLL)
    ├── win32/                       # Para sistemas 32-bit
    └── x64/                         # Para sistemas 64-bit
```

## Dependencias Incluidas

El JAR ejecutable incluye referencias a todas las dependencias necesarias:
- **AbsoluteLayout.jar** - Layout manager para interfaces gráficas
- **FDxSDKPro.jar** - SDK de SecuGen para control del lector de huellas
- **mariadb-java-client-3.5.6.jar** - Driver JDBC para MariaDB
- **mysql-connector-j-8.0.33.jar** - Driver JDBC alternativo para MySQL
- **json-20231013.jar** - Librería para manejo de JSON
- **webp-imageio-0.2.0.jar** - Soporte para imágenes WebP

Todas estas librerías deben estar en la carpeta `lib/` junto al JAR ejecutable.

## Funcionalidades de la Aplicación

1. **Inicialización Automática del Lector**
   - La aplicación detecta y conecta automáticamente con el lector de huellas al iniciar

2. **Registro de Huellas**
   - Captura y almacena plantillas de huellas digitales

3. **Verificación de Huellas**
   - Compara huellas capturadas con las almacenadas en la base de datos

4. **Control de Asistencia**
   - Registra entradas y salidas del personal
   - Almacena registros en la base de datos MariaDB

5. **Control de Calidad**
   - Verifica calidad mínima de 60
   - Requiere mínimo 20 minucias en la huella
   - Nivel máximo NFIQ de 2

## Solución de Problemas

### Error: "Java no reconocido como comando"
- Instala Java JRE 8 o superior
- Verifica que Java esté en el PATH del sistema

### Error: "No se encuentra la clase principal"
- Verifica que todas las librerías estén en `netbeans_sample\dist\lib\`
- Asegúrate de ejecutar desde el directorio correcto

### Error: "No se puede conectar con el lector"
- Verifica que el lector SecuGen esté conectado por USB
- Instala los drivers del lector si no los tienes
- Verifica que las DLLs correctas estén en el PATH

### Error de Conexión a Base de Datos
- Verifica conectividad de red con el servidor 212.104.172.216
- Confirma que el puerto 13306 no esté bloqueado por firewall
- Verifica credenciales de acceso

## Reconstruir el Proyecto

Si necesitas modificar y recompilar el proyecto:

```batch
cd netbeans_sample
ant clean
ant jar
```

El nuevo JAR se generará en `netbeans_sample\dist\FDxSDKPro.jar`

## Información Técnica

- **Versión de Java**: Compilado para Java 8 (compatible con versiones superiores)
- **Build Tool**: Apache Ant 1.10.15
- **Clase Principal**: `SecuGen.FDxSDKPro.samples.JSGD`
- **SDK Version**: FDx SDK Pro v4.3.1

## Soporte

Para problemas o preguntas sobre:
- **SDK de SecuGen**: Consulta la documentación en `FDx SDK Pro Programming Manual (Java) SG1-0040A-005.pdf`
- **Código fuente**: Revisa `netbeans_sample\src\SecuGen\FDxSDKPro\samples\JSGD.java`
