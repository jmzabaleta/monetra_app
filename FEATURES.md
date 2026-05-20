# Monetra - Guía de características

## 📱 Pantallas principales

### 1. Dashboard (Inicio)
**Ubicación**: Primera pestaña
**Funciones**:
- Visualiza tu balance total en un hero card con gradiente
- Ve tus ingresos y gastos del mes en tarjetas de estadísticas
- Gráfico de flujo mensual (últimos 6 días)
- Últimas 4 transacciones registradas
- Acceso rápido a notificaciones (botón en AppBar)

**Botones**:
- 🔔 Notificaciones (AppBar)

---

### 2. Movimientos (Transacciones)
**Ubicación**: Segunda pestaña
**Funciones**:
- Visualiza todas tus transacciones (ingresos y gastos)
- Administra categorías personalizadas
- Busca transacciones por nombre o nota
- Filtra por tipo: Todo, Ingresos, Gastos

**Botones**:
- ➕ FAB (Floating Action Button):
  - Si no hay categorías: lleva a crear una
  - Si hay categorías: lleva a crear transacción
- ➕ Nueva categoría (en el header)

**Cómo crear una transacción**:
1. Presiona el botón de transacción
2. Elige si es Gasto o Ingreso
3. Completa: Título, Monto, Categoría, Nota
4. Presiona "Guardar"

**Cómo crear una categoría**:
1. Presiona el botón de categoría
2. Ingresa el nombre
3. Elige un ícono (swipe horizontal en los íconos)
4. Elige un color (toca los círculos de color)
5. Presiona "Guardar"

---

### 3. Metas
**Ubicación**: Tercera pestaña
**Funciones**:
- Crea metas de ahorro y sigue tu progreso
- Ve la barra de progreso animada
- Visualiza fechas límite

**Botones**:
- ➕ Crear meta (FAB)

**Cómo crear una meta**:
1. Presiona "Crear meta"
2. Ingresa nombre, cantidad objetivo y cantidad ahorrada
3. Presiona "Guardar"

**Gestión de metas**:
- Toca una meta para editarla
- Usa el menú popup (⋮) para editar o eliminar

---

### 4. Estadísticas
**Ubicación**: Cuarta pestaña
**Funciones**:
- Gráfico de pastel con gastos por categoría
- Tabla detallada de gastos
- Gráfico de barras de ingresos vs gastos (últimos 5 meses)
- Insights automáticos

---

### 5. Perfil
**Ubicación**: Quinta pestaña
**Funciones**:
- Gestión de preferencias
- Cambio de tema (Sistema, Claro, Oscuro)
- Cambio de moneda (COP, USD, EUR)
- Información y legal
- Logout

**Botones**:
- 🔐 Seguridad (Futura integración de PIN y biometría)
- 📄 Términos de Servicio
- 🔒 Política de Privacidad
- 🚪 Cerrar sesión

---

## 🔐 Autenticación

### Pantalla de Login/Signup
- **Modo Login**: Inicia sesión con email y contraseña
- **Modo Signup**: Crea una nueva cuenta
- **Cambio de modo**: Usa los botones de texto en la parte inferior
- **Auth Social**: Integración futura con Google y Apple
- **Validación**: Campos obligatorios marcados

---

## 💾 Datos

### Almacenamiento
- **Local**: SQLite con Isar
- **Moneda**: Configurable en Perfil
- **Tema**: Sincronizado con dispositivo

### Categorías
Puedes personalizar completamente:
- Nombre
- Ícono (12 opciones)
- Color (8 opciones)

---

## 🎨 Diseño

### Colores principales
- 🟢 **Emerald**: Ingresos y positivo (#10B981)
- 🔵 **Blue**: Secundario (#2563EB)
- 🔴 **Coral**: Gastos y negativo (#FF6B6B)
- 🟡 **Amber**: Alerta (#F59E0B)

### Componentes visuales
- **Cards**: Contenedores con esquinas redondeadas
- **Buttons**: Material Design 3 con estados visuales
- **Icons**: Material Icons redondeados
- **Gradientes**: En dashboard y auth

---

## 🎯 Flujos principales

### Flujo de configuración inicial
1. Login/Signup
2. Ir a Movimientos
3. Crear una categoría
4. Crear tu primera transacción
5. Ver dashboard actualizado

### Flujo de seguimiento
1. Diariamente: Registra transacciones
2. Semanalmente: Revisa estadísticas
3. Mensualmente: Ajusta presupuesto y metas

---

## ⌨️ Atajos y tips

- **Buscar transacciones**: Usa la barra de búsqueda en Movimientos
- **Filtrar por tipo**: Usa los botones segmentados (Todo, Ingresos, Gastos)
- **Editar transacción**: Toca sobre la transacción en la lista
- **Editar categoría**: Toca sobre el chip de categoría
- **Editar meta**: Toca sobre la tarjeta de meta
- **Popup menu**: Usa ⋮ en metas para más opciones

---

## 🐛 Troubleshooting

**P: ¿Por qué no puedo crear una transacción?**
R: Primero debes crear al menos una categoría. Presiona el botón FAB para crear una.

**P: ¿Cómo cambio la moneda?**
R: Ve a Perfil → Moneda y selecciona COP, USD o EUR.

**P: ¿Puedo recuperar una transacción eliminada?**
R: Actualmente no hay papelera. Se trabaja en esa funcionalidad.

**P: ¿Mis datos se sincronizan con la nube?**
R: De momento, los datos son locales. Próximamente sincronización en la nube.

---

## 📝 Versión
**Monetra v1.0.0**
Última actualización: 2026-05-17

¿Preguntas? 📧 Contacta al equipo de soporte.
