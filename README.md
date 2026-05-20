# 💰 Monetra - Personal Finance App

Una aplicación Flutter moderna para gestionar tus finanzas personales con un diseño limpio, intuitivo y profesional.

## ✨ Características

- 📊 **Dashboard**: Visualiza tu balance total, ingresos, gastos y flujo mensual
- 💳 **Transacciones**: Registra ingresos y gastos con categorías personalizadas
- 🎯 **Metas de Ahorro**: Crea y sigue metas financieras con progreso visual
- 📈 **Estadísticas**: Análisis detallado de gastos por categoría y tendencias mensuales
- 👤 **Perfil**: Personaliza tema, moneda y preferencias
- 🔐 **Seguridad**: Autenticación con login/signup integrados
- 🎨 **Diseño Moderno**: Material Design 3 con soporte para dark mode

## 🚀 Inicio Rápido

### Requisitos
- Flutter 3.11.5+
- Dart 3.11.5+

### Instalación

```bash
# Clonar repositorio
git clone <repo-url>
cd monetra_app

# Obtener dependencias
flutter pub get

# Ejecutar generador de código (Isar)
flutter pub run build_runner build

# Ejecutar la app
flutter run
```

### Plataformas Soportadas
- ✅ iOS 11+
- ✅ Android 5.0+
- ✅ Web (Chrome, Firefox, Safari)
- ✅ macOS
- ✅ Windows
- ✅ Linux

## 📦 Dependencias Principales

- **flutter_riverpod**: Gestión de estado
- **go_router**: Navegación
- **isar**: Base de datos local
- **fl_chart**: Gráficos
- **intl**: Internacionalización

## 🎯 Estructura del Proyecto

```
lib/
├── core/
│   ├── constants/     # Constantes y paleta de colores
│   ├── database/      # Configuración de Isar
│   ├── router/        # Rutas y navegación
│   ├── theme/         # Temas (claro/oscuro)
│   └── utils/         # Utilidades (formateo, etc.)
├── features/
│   ├── auth/          # Autenticación
│   ├── dashboard/     # Panel principal
│   ├── transactions/  # Transacciones
│   ├── savings/       # Metas de ahorro
│   ├── statistics/    # Estadísticas
│   └── profile/       # Perfil de usuario
├── shared/
│   └── widgets/       # Componentes reutilizables
└── main.dart          # Punto de entrada

```

## 📖 Documentación

- [FEATURES.md](FEATURES.md) - Guía completa de características
- [IMPROVEMENTS.md](IMPROVEMENTS.md) - Detalle de mejoras implementadas
- [CHANGELOG.md](CHANGELOG.md) - Historial de cambios

## 🎨 Personalización

### Cambiar Tema
Ve a **Perfil** → **Tema** y selecciona:
- Sistema (sigue configuración del dispositivo)
- Claro
- Oscuro

### Cambiar Moneda
Ve a **Perfil** → **Moneda** y selecciona:
- COP (Peso Colombiano)
- USD (Dólar Estadounidense)
- EUR (Euro)

## 🔐 Seguridad

- Datos almacenados localmente con Isar
- Preparado para integración con PIN y biometría
- Validación robusta de formularios
- Manejo seguro de contraseñas

## 🧪 Testing

```bash
# Ejecutar tests
flutter test

# Ejecutar análisis de código
flutter analyze
```

## 🤝 Contribuciones

Las contribuciones son bienvenidas. Por favor:
1. Fork el repositorio
2. Crea una rama para tu feature
3. Commit tus cambios
4. Push a la rama
5. Abre un Pull Request

## 📋 Roadmap

### v1.1.0
- [ ] Autenticación con Firebase
- [ ] Sincronización en la nube
- [ ] Papelera de reciclaje
- [ ] Exportar a PDF/Excel

### v1.2.0
- [ ] Notificaciones push
- [ ] Análisis predictivo
- [ ] Integración con bancos
- [ ] Compartir reportes

### v2.0.0
- [ ] Versión web avanzada
- [ ] API backend completo
- [ ] Soporte multiusuario
- [ ] Características de colaboración

## 📄 Licencia

Este proyecto está bajo licencia MIT. Ver [LICENSE](LICENSE) para más detalles.

## 📞 Contacto

- 📧 Email: support@monetra.app
- 🐛 Reportar bugs: [Issues](https://github.com/monetra/issues)
- 💡 Sugerencias: [Discussions](https://github.com/monetra/discussions)

## 🙏 Agradecimientos

- Flutter Team por el framework excelente
- Material Design por los principios de diseño
- Comunidad de Flutter por el soporte

---

**Versión**: 1.0.0
**Última actualización**: 17 de mayo, 2026

¡Disfruta organizando tus finanzas con Monetra! 💰✨
