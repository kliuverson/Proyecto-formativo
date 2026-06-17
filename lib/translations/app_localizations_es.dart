// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appName => 'Ferremateriales DGC';

  @override
  String get appSlogan => 'Tu ferretería de confianza';

  @override
  String get search => 'Buscar herramientas...';

  @override
  String noProductsFound(String query) {
    return 'No se encontraron productos\npara \"$query\"';
  }

  @override
  String results(int count) {
    return '$count resultado(s)';
  }

  @override
  String get featuredProducts => 'Productos Destacados';

  @override
  String get navHome => 'Inicio';

  @override
  String get navProducts => 'Productos';

  @override
  String get navCategories => 'Categorías';

  @override
  String get navFavorites => 'Favoritos';

  @override
  String get navCart => 'Carrito';

  @override
  String get navProfile => 'Perfil';

  @override
  String get drawerHome => 'Inicio';

  @override
  String get drawerCategories => 'Categorías';

  @override
  String get drawerProducts => 'Productos';

  @override
  String get drawerCart => 'Mi Carrito';

  @override
  String get drawerFavorites => 'Mis Favoritos';

  @override
  String get drawerOrders => 'Mis Pedidos';

  @override
  String get drawerAccount => 'Mi Cuenta';

  @override
  String get drawerAddresses => 'Direcciones';

  @override
  String get drawerAbout => 'Acerca de Nosotros';

  @override
  String get drawerSupport => 'Contacto / Soporte';

  @override
  String get drawerLogout => 'Cerrar Sesión';

  @override
  String get logoutTitle => 'Cerrar sesión';

  @override
  String get logoutConfirm => '¿Seguro que deseas salir?';

  @override
  String get cancel => 'Cancelar';

  @override
  String get exit => 'Salir';

  @override
  String get loginTitle => '¡Bienvenido de nuevo!';

  @override
  String get loginSubTitle =>
      'Las mejores herramientas y materiales para construir tus ideas';

  @override
  String get firstName => 'Nombre';

  @override
  String get lastName => 'Apellido';

  @override
  String get email => 'Correo electrónico';

  @override
  String get password => 'Contraseña';

  @override
  String get signIn => 'Iniciar sesión';

  @override
  String get createAccount => 'Crear cuenta';

  @override
  String get orSignInWith => 'O iniciar sesión con';

  @override
  String get orSignUpWith => 'O regístrate con';

  @override
  String get iAgreeTo => 'Acepto los';

  @override
  String get privacyPolicy => 'Política de privacidad';

  @override
  String get termsOfUse => 'Términos de uso';

  @override
  String get and => 'y';

  @override
  String get titleRegister => 'Crea tu cuenta';

  @override
  String get accountSettings => 'Configuración de la cuenta';

  @override
  String get profileTitle => 'Perfil';

  @override
  String get profileSubtitle => 'Actualiza tu información personal';

  @override
  String get myAddresses => 'Mis direcciones';

  @override
  String get myAddressesSubtitle => 'Agrega tus direcciones de entrega';

  @override
  String get paymentMethods => 'Métodos de pago';

  @override
  String get paymentMethodsSubtitle => 'Administra tus tarjetas';

  @override
  String get security => 'Seguridad';

  @override
  String get securitySubtitle => 'Cambiar contraseña';

  @override
  String get purchases => 'Compras';

  @override
  String get myOrders => 'Mis pedidos';

  @override
  String get myOrdersSubtitle => 'Consulta tu historial de compras';

  @override
  String get myFavorites => 'Favoritos';

  @override
  String get myFavoritesSubtitle => 'Productos guardados';

  @override
  String get coupons => 'Cupones';

  @override
  String get couponsSubtitle => 'Descuentos disponibles';

  @override
  String get preferences => 'Preferencias';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get notificationsSubtitle => 'Configura alertas';

  @override
  String get language => 'Idioma';

  @override
  String get languageSubtitle => 'Selecciona tu idioma';

  @override
  String get darkMode => 'Modo oscuro';

  @override
  String get darkModeSubtitleOn => 'Apariencia oscura activa';

  @override
  String get darkModeSubtitleOff => 'Cambiar apariencia';

  @override
  String get support => 'Soporte';

  @override
  String get helpCenter => 'Centro de ayuda';

  @override
  String get helpCenterSubtitle => 'Soporte y preguntas frecuentes';

  @override
  String get termsAndConditions => 'Términos y condiciones';

  @override
  String get termsAndConditionsSubtitle => 'Información legal';

  @override
  String get privacyPolicyTitle => 'Política de privacidad';

  @override
  String get privacyPolicySubtitle => 'Cómo protegemos tus datos';

  @override
  String get logout => 'Cerrar sesión';

  @override
  String get logoutSubtitle => 'Salir de la cuenta';

  @override
  String get ordersTitle => 'Mis pedidos';

  @override
  String get noOrders => 'No tienes pedidos';

  @override
  String get favoritesTitle => 'Mis Favoritos';

  @override
  String get noFavorites => 'No tienes productos en favoritos';

  @override
  String get noFavoritesHint =>
      '¡Marca el corazón en tus productos para añadirlos!';

  @override
  String favoriteProducts(int count) {
    return 'Productos favoritos: $count';
  }

  @override
  String get inStock => 'En stock';

  @override
  String get profileUpdated => 'Perfil actualizado correctamente';

  @override
  String get addressesTitle => 'Mis direcciones';

  @override
  String get addAddress => 'Agregar dirección';

  @override
  String get editAddress => 'Editar dirección';

  @override
  String get noAddresses => 'No tienes direcciones guardadas';

  @override
  String get recipientName => 'Nombre destinatario';

  @override
  String get phone => 'Teléfono';

  @override
  String get department => 'Departamento';

  @override
  String get city => 'Ciudad';

  @override
  String get address => 'Dirección';

  @override
  String get reference => 'Referencia';

  @override
  String get postalCode => 'Código postal';

  @override
  String get mainAddress => 'Dirección principal';

  @override
  String get saveAddress => 'Guardar dirección';

  @override
  String get requiredField => 'Campo requerido';

  @override
  String get principal => 'Principal';

  @override
  String addressReference(String ref) {
    return 'Referencia: $ref';
  }

  @override
  String get cartTitle => 'Mi Carrito';

  @override
  String get emptyCart => 'Tu carrito está vacío';

  @override
  String get emptyCartHint => 'Agrega productos para continuar';

  @override
  String quantity(int qty) {
    return 'Cantidad: $qty';
  }

  @override
  String get total => 'Total';

  @override
  String get proceedToPayment => 'Proceder al pago';

  @override
  String get checkingPayment => 'Comprobando pago...';

  @override
  String get paymentConfirmed => 'Pago confirmado';

  @override
  String get paymentNotCompleted => 'Pago no completado';

  @override
  String paymentError(String error) {
    return 'Error procesando pago: $error';
  }

  @override
  String get checkingPaymentTitle => 'Comprobando pago';

  @override
  String get categoryTitle => 'Herramientas';

  @override
  String get searchCategory => 'Buscar categoría...';

  @override
  String get catalogYear => 'CATÁLOGO 2026';

  @override
  String get categoryHeaderTitle => 'ENCUENTRA TODO LO';

  @override
  String get categoryHeaderSubtitle => 'QUE NECESITAS';

  @override
  String get categoryHeaderDesc =>
      'Explora nuestras categorías y encuentra las mejores herramientas.';

  @override
  String get categoriesLabel => 'Categorías';

  @override
  String get seeAll => 'Ver todas';

  @override
  String get productListTitle => 'Lista de Productos';

  @override
  String get editProfileTitle => 'Editar Perfil';

  @override
  String get username => 'Usuario';

  @override
  String get correo => 'Correo';

  @override
  String get telefono => 'Teléfono';

  @override
  String get saveChanges => 'Guardar Cambios';

  @override
  String get noChanges => 'No hiciste cambios';

  @override
  String get aboutTitle => 'Acerca de Nosotros';

  @override
  String get aboutSince => 'Ferremateriales DGC · Desde 2010';

  @override
  String get aboutWhoWeAre => '¿Quiénes somos?';

  @override
  String get aboutWhoWeAreContent =>
      'Ferremateriales DGC es una empresa colombiana dedicada a la venta de materiales de construcción, herramientas y acabados para el hogar. Nacimos con el propósito de acercar los mejores productos del sector ferretero a nuestros clientes de forma rápida y confiable.';

  @override
  String get aboutMission => 'Nuestra misión';

  @override
  String get aboutMissionContent =>
      'Proveer materiales de construcción y ferretería de alta calidad, ofreciendo una experiencia de compra ágil, segura y accesible, tanto en nuestra tienda física como a través de nuestra aplicación móvil.';

  @override
  String get aboutVision => 'Nuestra visión';

  @override
  String get aboutVisionContent =>
      'Ser la ferretería de referencia en la región, reconocida por la calidad de nuestros productos, la excelencia en el servicio al cliente y nuestra capacidad de innovación digital.';

  @override
  String get aboutValues => 'Nuestros valores';

  @override
  String get aboutValuesContent =>
      'Confianza, honestidad y compromiso guían cada una de nuestras acciones. Creemos en relaciones duraderas con nuestros clientes, proveedores y colaboradores, basadas en el respeto y la transparencia.';

  @override
  String get aboutWhyUs => '¿Por qué elegirnos?';

  @override
  String get aboutWhyUsContent =>
      'Contamos con un amplio catálogo de productos, precios competitivos, asesoría personalizada y entregas a domicilio. Nuestra app te permite explorar categorías, gestionar tus pedidos y contactarnos en cualquier momento.';

  @override
  String get aboutContact => 'Contáctanos';

  @override
  String get aboutContactContent =>
      '¿Tienes alguna pregunta o sugerencia? Escríbenos a contacto@ferremateriales.com o visítanos en nuestra tienda. Estamos aquí para ayudarte.';

  @override
  String get helpCenterTitle => 'Centro de ayuda';

  @override
  String get faqLabel => 'Preguntas frecuentes';

  @override
  String get faqSubtitle => 'Encuentra respuestas a las dudas más comunes';

  @override
  String get faq1Q => '¿Cómo realizo un pedido?';

  @override
  String get faq1A =>
      'Agrega productos al carrito y sigue los pasos de pago desde la sección Carrito.';

  @override
  String get faq2Q => '¿Cuáles son los métodos de pago?';

  @override
  String get faq2A =>
      'Aceptamos tarjeta débito, crédito y transferencia bancaria.';

  @override
  String get faq3Q => '¿Cuánto tarda el envío?';

  @override
  String get faq3A =>
      'El envío estándar tarda entre 2 y 5 días hábiles según tu ubicación.';

  @override
  String get faq4Q => '¿Puedo cancelar un pedido?';

  @override
  String get faq4A =>
      'Sí, puedes cancelar un pedido antes de que sea despachado desde la sección Pedidos.';

  @override
  String get faq5Q => '¿Cómo contacto al soporte?';

  @override
  String get faq5A =>
      'Puedes escribirnos a soporte@ferremateriales.com o llamar al 300 123 4567.';

  @override
  String get termsTitle => 'Términos y condiciones';

  @override
  String get termsLastUpdate => 'Última actualización: junio 2025';

  @override
  String get terms1Title => '1. Aceptación de los términos';

  @override
  String get terms1Content =>
      'Al usar esta aplicación, aceptas estos términos en su totalidad. Si no estás de acuerdo, por favor no uses el servicio.';

  @override
  String get terms2Title => '2. Uso del servicio';

  @override
  String get terms2Content =>
      'Esta plataforma es exclusiva para la compra de productos de ferretería y materiales de construcción. Queda prohibido el uso indebido o con fines ilícitos.';

  @override
  String get terms3Title => '3. Cuenta de usuario';

  @override
  String get terms3Content =>
      'Eres responsable de mantener la confidencialidad de tus credenciales. Notifícanos de inmediato ante cualquier uso no autorizado de tu cuenta.';

  @override
  String get terms4Title => '4. Precios y pagos';

  @override
  String get terms4Content =>
      'Los precios están expresados en pesos colombianos e incluyen IVA. Nos reservamos el derecho de modificar precios sin previo aviso.';

  @override
  String get terms5Title => '5. Cancelaciones y devoluciones';

  @override
  String get terms5Content =>
      'Puedes cancelar un pedido antes de su despacho. Las devoluciones se gestionan dentro de los 5 días hábiles siguientes a la entrega.';

  @override
  String get terms6Title => '6. Contacto';

  @override
  String get terms6Content =>
      'Para consultas sobre estos términos escríbenos a legal@ferremateriales.com.';

  @override
  String get privacyTitle => 'Política de privacidad';

  @override
  String get privacyLastUpdate => 'Última actualización: junio 2025';

  @override
  String get privacy1Title => 'Datos que recopilamos';

  @override
  String get privacy1Content =>
      'Recopilamos nombre, correo electrónico, dirección de entrega y datos de uso de la app para brindarte una mejor experiencia.';

  @override
  String get privacy2Title => 'Uso de la información';

  @override
  String get privacy2Content =>
      'Usamos tus datos para procesar pedidos, personalizar tu experiencia y enviarte notificaciones relevantes. Nunca vendemos tu información a terceros.';

  @override
  String get privacy3Title => 'Almacenamiento y seguridad';

  @override
  String get privacy3Content =>
      'Tu información se almacena en servidores seguros con cifrado. Aplicamos medidas técnicas y organizativas para proteger tus datos.';

  @override
  String get privacy4Title => 'Tus derechos';

  @override
  String get privacy4Content =>
      'Tienes derecho a acceder, corregir o eliminar tus datos personales. Puedes ejercerlos escribiéndonos a privacidad@ferremateriales.com.';

  @override
  String get privacy5Title => 'Cookies';

  @override
  String get privacy5Content =>
      'Usamos cookies para mejorar el rendimiento de la app. Puedes desactivarlas desde la configuración de tu dispositivo.';

  @override
  String get contactTitle => 'Contacto / Soporte';

  @override
  String get contactSubtitle => 'Estamos aquí para ayudarte';

  @override
  String get contactHelpTitle => '¿En qué podemos ayudarte?';

  @override
  String get contactHelpContent =>
      'Nuestro equipo de soporte está disponible para resolver tus dudas sobre pedidos, productos, entregas o cualquier inconveniente que tengas con la app.';

  @override
  String get contactScheduleTitle => 'Horario de atención';

  @override
  String get contactScheduleContent =>
      'Lunes a viernes de 8:00 a.m. a 6:00 p.m.\nSábados de 8:00 a.m. a 1:00 p.m.\nDomingos y festivos: cerrado.';

  @override
  String get contactChannels => 'Canales de contacto';

  @override
  String get contactEmail => 'Correo electrónico';

  @override
  String get contactPhone => 'Teléfono / WhatsApp';

  @override
  String get contactVisit => 'Visítanos';

  @override
  String get contactVisitAddress => 'Cra. 10 #45-30, Barranquilla, Colombia';

  @override
  String get contactWhatsapp => 'Chatear por WhatsApp';

  @override
  String get myAccount => 'Mi cuenta';

  @override
  String get noCategoriesFound => 'No se encontraron categorías';

  @override
  String get categoryLabel => 'Categoría';

  @override
  String get bannerOffer => 'Oferta especial';

  @override
  String get banner1Title => 'Hasta 30% OFF';

  @override
  String get banner1Subtitle => 'En herramientas';

  @override
  String get banner2Title => 'Nuevos productos';

  @override
  String get banner2Subtitle => 'Para construcción';

  @override
  String get banner3Title => 'Grandes descuentos';

  @override
  String get banner3Subtitle => 'Solo esta semana';

  @override
  String get categoryBathroomName => 'Baños';

  @override
  String get categoryBathroomDesc => 'Griferia, regaderas, accesorios y más';

  @override
  String get categoryFloorsName => 'Pisos';

  @override
  String get categoryFloorsDesc => 'Cerámicos, porcelanatos y madera';

  @override
  String get categoryConstructionName => 'Construcción';

  @override
  String get categoryConstructionDesc =>
      'Cemento, varilla y materiales básicos';

  @override
  String get categoryElectricalName => 'Electricidad';

  @override
  String get categoryElectricalDesc => 'Cables, interruptores y más';

  @override
  String orderNumber(String id) {
    return 'Pedido #$id';
  }

  @override
  String productsCount(int count) {
    return 'Productos: $count';
  }

  @override
  String orderTotal(String total) {
    return 'Total: $total';
  }

  @override
  String get statusPaid => 'pagado';

  @override
  String get statusPending => 'pendiente';

  @override
  String get statusFailed => 'fallido';

  @override
  String get noDescription => 'Sin descripción disponible';

  @override
  String get addToCart => 'Agregar al carrito';

  @override
  String get productAddedToCart => 'Producto agregado al carrito';

  @override
  String get forgotPasswordTitle => '¿Olvidaste tu contraseña?';

  @override
  String get forgotPasswordSubtitle =>
      'Ingresa tu correo electrónico y te enviaremos un enlace para restablecer tu contraseña.';

  @override
  String get forgotPasswordEmailLabel => 'Correo electrónico';

  @override
  String get forgotPasswordEmailHint => 'ejemplo@correo.com';

  @override
  String get forgotPasswordEmailRequired =>
      'Por favor ingresa tu correo electrónico';

  @override
  String get forgotPasswordEmailInvalid =>
      'Por favor ingresa un correo electrónico válido';

  @override
  String get forgotPasswordButton => 'Enviar enlace de restablecimiento';
}
