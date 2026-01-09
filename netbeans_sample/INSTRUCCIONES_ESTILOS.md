# Instrucciones para Estilizar la Interfaz Gráfica

## Opción 1: FlatLaf (Recomendado - Look and Feel Moderno)

### Pasos para instalar FlatLaf:

1. **Descargar FlatLaf:**
   - Visita: https://github.com/JFormDesigner/FlatLaf/releases
   - Descarga la versión más reciente (ej: `flatlaf-3.2.5.jar`)
   - O descarga directamente desde Maven Central

2. **Agregar al proyecto:**
   - Copia el archivo `flatlaf-3.2.5.jar` a la carpeta `netbeans_sample/lib/`
   - El archivo `build.xml` ya está configurado para incluir FlatLaf

3. **Compilar y ejecutar:**
   - El código ya está preparado para usar FlatLaf automáticamente
   - Si FlatLaf no está disponible, usará Nimbus (incluido en Java)

## Opción 2: Usar Nimbus (Sin dependencias adicionales)

El código ya está configurado para usar Nimbus si FlatLaf no está disponible. Nimbus viene incluido con Java, por lo que no requiere descargas adicionales.

## Personalización Adicional

El código incluye personalizaciones de colores y estilos en el método `customizeUI()`. Puedes modificar:

- **Colores de botones**: Cambia `Button.background` y `Button.foreground`
- **Colores de paneles**: Modifica `Panel.background`
- **Fuentes**: Ajusta las fuentes en los componentes
- **Bordes**: Personaliza los bordes de los campos de texto

### Ejemplo de personalización de colores:

```java
// Cambiar color principal de botones
javax.swing.UIManager.put("Button.background", new java.awt.Color(34, 139, 34)); // Verde
javax.swing.UIManager.put("Button.foreground", java.awt.Color.WHITE);

// Cambiar color de fondo
javax.swing.UIManager.put("Panel.background", new java.awt.Color(240, 248, 255)); // Azul claro
```

## Temas Disponibles en FlatLaf

Si usas FlatLaf, puedes cambiar entre diferentes temas:

- **FlatLightLaf**: Tema claro (por defecto)
- **FlatDarkLaf**: Tema oscuro
- **FlatIntelliJLaf**: Estilo IntelliJ IDEA
- **FlatDarculaLaf**: Estilo Darcula

Para cambiar el tema, modifica el método `main()`:

```java
// Tema oscuro
Class<?> lafClass = Class.forName("com.formdev.flatlaf.FlatDarkLaf");

// Tema IntelliJ
Class<?> lafClass = Class.forName("com.formdev.flatlaf.FlatIntelliJLaf");
```

## Notas

- Los estilos personalizados se aplican después de establecer el Look and Feel
- Si quieres desactivar la personalización, comenta el método `customizeUI()`
- Los colores y fuentes se pueden ajustar según tus preferencias de marca
