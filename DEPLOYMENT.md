# 🚀 Guía de Compilación y Deployment - Monetra v1.0.0

## 📋 Verificación Previa

Antes de compilar, asegúrate de tener:

```bash
# Verificar Flutter
flutter --version
# Debe ser 3.11.5 o superior

# Verificar Dart
dart --version
# Debe venir con Flutter

# Verificar dispositivos conectados
flutter devices
```

## 🔧 Setup Inicial

### 1. Instalar dependencias
```bash
cd monetra_app
flutter pub get
```

### 2. Generar código (Isar database)
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

## 📱 Desarrollo Local

### Ejecutar en emulador/dispositivo
```bash
# Listar dispositivos disponibles
flutter devices

# Ejecutar en dispositivo específico
flutter run -d <device-id>

# Ejecutar con observatorio (DevTools)
flutter run --observatory-port=50300
```

### Hot Reload durante desarrollo
```bash
# Presiona 'r' para hot reload
# Presiona 'R' para hot restart
# Presiona 'q' para salir
```

## 🏗️ Compilación para Producción

### Android

#### APK (recomendado para testing)
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

#### App Bundle (para Play Store)
```bash
flutter build appbundle --release
# Output: build/app/outputs/bundle/release/app-release.aab
```

#### Con firma personalizada
```bash
flutter build appbundle \
  --release \
  --target-platform android-arm64
```

### iOS

#### IPA (para TestFlight/App Store)
```bash
flutter build ipa --release
# Output: build/ios/ipa/Monetra.ipa
```

#### Abrir en Xcode
```bash
open ios/Runner.xcworkspace
# Luego seguir el proceso de firma en Xcode
```

### Web

#### Build web
```bash
flutter build web --release
# Output: build/web/
```

#### Deploy a Firebase Hosting
```bash
firebase deploy --only hosting
```

### macOS

```bash
flutter build macos --release
# Output: build/macos/Build/Release/Monetra.app
```

### Windows

```bash
flutter build windows --release
# Output: build/windows/runner/Release/Monetra.exe
```

### Linux

```bash
flutter build linux --release
# Output: build/linux/x64/release/bundle/
```

## 📦 Play Store (Android)

### 1. Preparar firma
```bash
# Crear keystore
keytool -genkey -v -keystore ~/key.jks \
  -keyalg RSA -keysize 2048 -validity 10000 \
  -alias upload

# Configurar en build.gradle
```

### 2. Compilar bundle
```bash
flutter build appbundle --release
```

### 3. Subir a Play Store
- Ir a Google Play Console
- Seleccionar app
- Ir a Release → Production
- Subir AAB
- Configurar descripción, screenshots, etc.
- Enviar a revisión

## 🍎 App Store (iOS)

### 1. Certificados y perfiles
- Ir a Apple Developer
- Crear certificado de distribución
- Crear perfil de provisión
- Descargar en Xcode

### 2. Configurar en Xcode
- Abrir `ios/Runner.xcworkspace`
- Signing & Capabilities
- Seleccionar certificado y perfil

### 3. Compilar
```bash
flutter build ipa --release
```

### 4. Subir a App Store
- Usando Xcode
- O usando Transporter
- Rellenar información
- Enviar a revisión

## 🧪 Testing Antes de Producción

### Unit Tests
```bash
flutter test
```

### Widget Tests
```bash
flutter test --test-randomize-ordering-seed=random
```

### Integration Tests
```bash
flutter drive \
  --target=test_driver/app.dart \
  --driver=test_driver/integration_test.dart
```

## 📊 Monitoreo Post-Launch

### Crashlytics (Firebase)
```dart
// Ya integrado en main.dart
FirebaseCrashlytics.instance.recordError(error, stack);
```

### Analytics
```dart
// Track eventos importantes
analytics.logEvent(name: 'transaction_created');
```

## 🔍 Troubleshooting

### Problema: "Android Gradle Plugin not found"
```bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
```

### Problema: "iOS SDK not found"
```bash
sudo xcode-select --reset
flutter doctor -v
```

### Problema: "Web build fails"
```bash
flutter clean
flutter pub get
flutter build web --csp
```

## 📋 Checklist Pre-Deploy

- [ ] Versión actualizada en `pubspec.yaml`
- [ ] CHANGELOG.md actualizado
- [ ] Test unitarios pasan (100%)
- [ ] No hay warnings en análisis
- [ ] Compilación local exitosa
- [ ] Verificación en múltiples dispositivos
- [ ] Certificados/firmas válidos
- [ ] Permisos en AndroidManifest.xml
- [ ] Privacy Policy actualizada
- [ ] Términos de servicio actualizados
- [ ] Screenshots y descripciones preparadas
- [ ] Build numbers incrementados
- [ ] Code obfuscation habilitado

## 📝 Versionamiento

### Sistema de versiones
```
MAJOR.MINOR.PATCH+BUILD
1.0.0+1

Incrementar:
- MAJOR: Cambios incompatibles
- MINOR: Nuevas características
- PATCH: Bug fixes
- BUILD: Cada envío a tienda
```

### Actualizar versión
```yaml
# pubspec.yaml
version: 1.0.0+1
```

## 🎯 Próximas Versiones

### v1.1.0
- [ ] Firebase Auth
- [ ] Sincronización en la nube
- [ ] Notificaciones push

### v1.2.0
- [ ] Análisis predictivo
- [ ] Integración con bancos
- [ ] Exportar a PDF

### v2.0.0
- [ ] Versión web avanzada
- [ ] Soporte multiusuario
- [ ] Características de colaboración

## 📞 Soporte

- 🐛 Reportar bugs: [GitHub Issues](https://github.com/monetra/issues)
- 💡 Sugerencias: [GitHub Discussions](https://github.com/monetra/discussions)
- 📧 Email: support@monetra.app

## ✅ Conclusión

¡Tu app Monetra está lista para producción!

- ✅ Código optimizado
- ✅ UI/UX mejorada
- ✅ Funcionalidad completa
- ✅ Documentación completa

**¡A lanzar! 🚀**
