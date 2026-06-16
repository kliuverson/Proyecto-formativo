import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'translations/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
  ];

  /// No description provided for @appName.
  ///
  /// In es, this message translates to:
  /// **'Ferremateriales DGC'**
  String get appName;

  /// No description provided for @appSlogan.
  ///
  /// In es, this message translates to:
  /// **'Tu ferretería de confianza'**
  String get appSlogan;

  /// No description provided for @search.
  ///
  /// In es, this message translates to:
  /// **'Buscar herramientas...'**
  String get search;

  /// No description provided for @noProductsFound.
  ///
  /// In es, this message translates to:
  /// **'No se encontraron productos\npara \"{query}\"'**
  String noProductsFound(String query);

  /// No description provided for @results.
  ///
  /// In es, this message translates to:
  /// **'{count} resultado(s)'**
  String results(int count);

  /// No description provided for @featuredProducts.
  ///
  /// In es, this message translates to:
  /// **'Productos Destacados'**
  String get featuredProducts;

  /// No description provided for @navHome.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get navHome;

  /// No description provided for @navProducts.
  ///
  /// In es, this message translates to:
  /// **'Productos'**
  String get navProducts;

  /// No description provided for @navCategories.
  ///
  /// In es, this message translates to:
  /// **'Categorías'**
  String get navCategories;

  /// No description provided for @navFavorites.
  ///
  /// In es, this message translates to:
  /// **'Favoritos'**
  String get navFavorites;

  /// No description provided for @navCart.
  ///
  /// In es, this message translates to:
  /// **'Carrito'**
  String get navCart;

  /// No description provided for @navProfile.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get navProfile;

  /// No description provided for @drawerHome.
  ///
  /// In es, this message translates to:
  /// **'Inicio'**
  String get drawerHome;

  /// No description provided for @drawerCategories.
  ///
  /// In es, this message translates to:
  /// **'Categorías'**
  String get drawerCategories;

  /// No description provided for @drawerProducts.
  ///
  /// In es, this message translates to:
  /// **'Productos'**
  String get drawerProducts;

  /// No description provided for @drawerCart.
  ///
  /// In es, this message translates to:
  /// **'Mi Carrito'**
  String get drawerCart;

  /// No description provided for @drawerFavorites.
  ///
  /// In es, this message translates to:
  /// **'Mis Favoritos'**
  String get drawerFavorites;

  /// No description provided for @drawerOrders.
  ///
  /// In es, this message translates to:
  /// **'Mis Pedidos'**
  String get drawerOrders;

  /// No description provided for @drawerAccount.
  ///
  /// In es, this message translates to:
  /// **'Mi Cuenta'**
  String get drawerAccount;

  /// No description provided for @drawerAddresses.
  ///
  /// In es, this message translates to:
  /// **'Direcciones'**
  String get drawerAddresses;

  /// No description provided for @drawerAbout.
  ///
  /// In es, this message translates to:
  /// **'Acerca de Nosotros'**
  String get drawerAbout;

  /// No description provided for @drawerSupport.
  ///
  /// In es, this message translates to:
  /// **'Contacto / Soporte'**
  String get drawerSupport;

  /// No description provided for @drawerLogout.
  ///
  /// In es, this message translates to:
  /// **'Cerrar Sesión'**
  String get drawerLogout;

  /// No description provided for @logoutTitle.
  ///
  /// In es, this message translates to:
  /// **'Cerrar sesión'**
  String get logoutTitle;

  /// No description provided for @logoutConfirm.
  ///
  /// In es, this message translates to:
  /// **'¿Seguro que deseas salir?'**
  String get logoutConfirm;

  /// No description provided for @cancel.
  ///
  /// In es, this message translates to:
  /// **'Cancelar'**
  String get cancel;

  /// No description provided for @exit.
  ///
  /// In es, this message translates to:
  /// **'Salir'**
  String get exit;

  /// No description provided for @loginTitle.
  ///
  /// In es, this message translates to:
  /// **'¡Bienvenido de nuevo!'**
  String get loginTitle;

  /// No description provided for @loginSubTitle.
  ///
  /// In es, this message translates to:
  /// **'Las mejores herramientas y materiales para construir tus ideas'**
  String get loginSubTitle;

  /// No description provided for @firstName.
  ///
  /// In es, this message translates to:
  /// **'Nombre'**
  String get firstName;

  /// No description provided for @lastName.
  ///
  /// In es, this message translates to:
  /// **'Apellido'**
  String get lastName;

  /// No description provided for @email.
  ///
  /// In es, this message translates to:
  /// **'Correo electrónico'**
  String get email;

  /// No description provided for @password.
  ///
  /// In es, this message translates to:
  /// **'Contraseña'**
  String get password;

  /// No description provided for @signIn.
  ///
  /// In es, this message translates to:
  /// **'Iniciar sesión'**
  String get signIn;

  /// No description provided for @createAccount.
  ///
  /// In es, this message translates to:
  /// **'Crear cuenta'**
  String get createAccount;

  /// No description provided for @orSignInWith.
  ///
  /// In es, this message translates to:
  /// **'O iniciar sesión con'**
  String get orSignInWith;

  /// No description provided for @orSignUpWith.
  ///
  /// In es, this message translates to:
  /// **'O regístrate con'**
  String get orSignUpWith;

  /// No description provided for @iAgreeTo.
  ///
  /// In es, this message translates to:
  /// **'Acepto los'**
  String get iAgreeTo;

  /// No description provided for @privacyPolicy.
  ///
  /// In es, this message translates to:
  /// **'Política de privacidad'**
  String get privacyPolicy;

  /// No description provided for @termsOfUse.
  ///
  /// In es, this message translates to:
  /// **'Términos de uso'**
  String get termsOfUse;

  /// No description provided for @and.
  ///
  /// In es, this message translates to:
  /// **'y'**
  String get and;

  /// No description provided for @titleRegister.
  ///
  /// In es, this message translates to:
  /// **'Crea tu cuenta'**
  String get titleRegister;

  /// No description provided for @accountSettings.
  ///
  /// In es, this message translates to:
  /// **'Configuración de la cuenta'**
  String get accountSettings;

  /// No description provided for @profileTitle.
  ///
  /// In es, this message translates to:
  /// **'Perfil'**
  String get profileTitle;

  /// No description provided for @profileSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Actualiza tu información personal'**
  String get profileSubtitle;

  /// No description provided for @myAddresses.
  ///
  /// In es, this message translates to:
  /// **'Mis direcciones'**
  String get myAddresses;

  /// No description provided for @myAddressesSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Agrega tus direcciones de entrega'**
  String get myAddressesSubtitle;

  /// No description provided for @paymentMethods.
  ///
  /// In es, this message translates to:
  /// **'Métodos de pago'**
  String get paymentMethods;

  /// No description provided for @paymentMethodsSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Administra tus tarjetas'**
  String get paymentMethodsSubtitle;

  /// No description provided for @security.
  ///
  /// In es, this message translates to:
  /// **'Seguridad'**
  String get security;

  /// No description provided for @securitySubtitle.
  ///
  /// In es, this message translates to:
  /// **'Cambiar contraseña'**
  String get securitySubtitle;

  /// No description provided for @purchases.
  ///
  /// In es, this message translates to:
  /// **'Compras'**
  String get purchases;

  /// No description provided for @myOrders.
  ///
  /// In es, this message translates to:
  /// **'Mis pedidos'**
  String get myOrders;

  /// No description provided for @myOrdersSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Consulta tu historial de compras'**
  String get myOrdersSubtitle;

  /// No description provided for @myFavorites.
  ///
  /// In es, this message translates to:
  /// **'Favoritos'**
  String get myFavorites;

  /// No description provided for @myFavoritesSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Productos guardados'**
  String get myFavoritesSubtitle;

  /// No description provided for @coupons.
  ///
  /// In es, this message translates to:
  /// **'Cupones'**
  String get coupons;

  /// No description provided for @couponsSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Descuentos disponibles'**
  String get couponsSubtitle;

  /// No description provided for @preferences.
  ///
  /// In es, this message translates to:
  /// **'Preferencias'**
  String get preferences;

  /// No description provided for @notifications.
  ///
  /// In es, this message translates to:
  /// **'Notificaciones'**
  String get notifications;

  /// No description provided for @notificationsSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Configura alertas'**
  String get notificationsSubtitle;

  /// No description provided for @language.
  ///
  /// In es, this message translates to:
  /// **'Idioma'**
  String get language;

  /// No description provided for @languageSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Selecciona tu idioma'**
  String get languageSubtitle;

  /// No description provided for @darkMode.
  ///
  /// In es, this message translates to:
  /// **'Modo oscuro'**
  String get darkMode;

  /// No description provided for @darkModeSubtitleOn.
  ///
  /// In es, this message translates to:
  /// **'Apariencia oscura activa'**
  String get darkModeSubtitleOn;

  /// No description provided for @darkModeSubtitleOff.
  ///
  /// In es, this message translates to:
  /// **'Cambiar apariencia'**
  String get darkModeSubtitleOff;

  /// No description provided for @support.
  ///
  /// In es, this message translates to:
  /// **'Soporte'**
  String get support;

  /// No description provided for @helpCenter.
  ///
  /// In es, this message translates to:
  /// **'Centro de ayuda'**
  String get helpCenter;

  /// No description provided for @helpCenterSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Soporte y preguntas frecuentes'**
  String get helpCenterSubtitle;

  /// No description provided for @termsAndConditions.
  ///
  /// In es, this message translates to:
  /// **'Términos y condiciones'**
  String get termsAndConditions;

  /// No description provided for @termsAndConditionsSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Información legal'**
  String get termsAndConditionsSubtitle;

  /// No description provided for @privacyPolicyTitle.
  ///
  /// In es, this message translates to:
  /// **'Política de privacidad'**
  String get privacyPolicyTitle;

  /// No description provided for @privacyPolicySubtitle.
  ///
  /// In es, this message translates to:
  /// **'Cómo protegemos tus datos'**
  String get privacyPolicySubtitle;

  /// No description provided for @logout.
  ///
  /// In es, this message translates to:
  /// **'Cerrar sesión'**
  String get logout;

  /// No description provided for @logoutSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Salir de la cuenta'**
  String get logoutSubtitle;

  /// No description provided for @ordersTitle.
  ///
  /// In es, this message translates to:
  /// **'Mis pedidos'**
  String get ordersTitle;

  /// No description provided for @noOrders.
  ///
  /// In es, this message translates to:
  /// **'No tienes pedidos'**
  String get noOrders;

  /// No description provided for @favoritesTitle.
  ///
  /// In es, this message translates to:
  /// **'Mis Favoritos'**
  String get favoritesTitle;

  /// No description provided for @noFavorites.
  ///
  /// In es, this message translates to:
  /// **'No tienes productos en favoritos'**
  String get noFavorites;

  /// No description provided for @noFavoritesHint.
  ///
  /// In es, this message translates to:
  /// **'¡Marca el corazón en tus productos para añadirlos!'**
  String get noFavoritesHint;

  /// No description provided for @favoriteProducts.
  ///
  /// In es, this message translates to:
  /// **'Productos favoritos: {count}'**
  String favoriteProducts(int count);

  /// No description provided for @inStock.
  ///
  /// In es, this message translates to:
  /// **'En stock'**
  String get inStock;

  /// No description provided for @profileUpdated.
  ///
  /// In es, this message translates to:
  /// **'Perfil actualizado correctamente'**
  String get profileUpdated;

  /// No description provided for @addressesTitle.
  ///
  /// In es, this message translates to:
  /// **'Mis direcciones'**
  String get addressesTitle;

  /// No description provided for @addAddress.
  ///
  /// In es, this message translates to:
  /// **'Agregar dirección'**
  String get addAddress;

  /// No description provided for @editAddress.
  ///
  /// In es, this message translates to:
  /// **'Editar dirección'**
  String get editAddress;

  /// No description provided for @noAddresses.
  ///
  /// In es, this message translates to:
  /// **'No tienes direcciones guardadas'**
  String get noAddresses;

  /// No description provided for @recipientName.
  ///
  /// In es, this message translates to:
  /// **'Nombre destinatario'**
  String get recipientName;

  /// No description provided for @phone.
  ///
  /// In es, this message translates to:
  /// **'Teléfono'**
  String get phone;

  /// No description provided for @department.
  ///
  /// In es, this message translates to:
  /// **'Departamento'**
  String get department;

  /// No description provided for @city.
  ///
  /// In es, this message translates to:
  /// **'Ciudad'**
  String get city;

  /// No description provided for @address.
  ///
  /// In es, this message translates to:
  /// **'Dirección'**
  String get address;

  /// No description provided for @reference.
  ///
  /// In es, this message translates to:
  /// **'Referencia'**
  String get reference;

  /// No description provided for @postalCode.
  ///
  /// In es, this message translates to:
  /// **'Código postal'**
  String get postalCode;

  /// No description provided for @mainAddress.
  ///
  /// In es, this message translates to:
  /// **'Dirección principal'**
  String get mainAddress;

  /// No description provided for @saveAddress.
  ///
  /// In es, this message translates to:
  /// **'Guardar dirección'**
  String get saveAddress;

  /// No description provided for @requiredField.
  ///
  /// In es, this message translates to:
  /// **'Campo requerido'**
  String get requiredField;

  /// No description provided for @principal.
  ///
  /// In es, this message translates to:
  /// **'Principal'**
  String get principal;

  /// No description provided for @addressReference.
  ///
  /// In es, this message translates to:
  /// **'Referencia: {ref}'**
  String addressReference(String ref);

  /// No description provided for @cartTitle.
  ///
  /// In es, this message translates to:
  /// **'Mi Carrito'**
  String get cartTitle;

  /// No description provided for @emptyCart.
  ///
  /// In es, this message translates to:
  /// **'Tu carrito está vacío'**
  String get emptyCart;

  /// No description provided for @emptyCartHint.
  ///
  /// In es, this message translates to:
  /// **'Agrega productos para continuar'**
  String get emptyCartHint;

  /// No description provided for @quantity.
  ///
  /// In es, this message translates to:
  /// **'Cantidad: {qty}'**
  String quantity(int qty);

  /// No description provided for @total.
  ///
  /// In es, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @proceedToPayment.
  ///
  /// In es, this message translates to:
  /// **'Proceder al pago'**
  String get proceedToPayment;

  /// No description provided for @checkingPayment.
  ///
  /// In es, this message translates to:
  /// **'Comprobando pago...'**
  String get checkingPayment;

  /// No description provided for @paymentConfirmed.
  ///
  /// In es, this message translates to:
  /// **'Pago confirmado'**
  String get paymentConfirmed;

  /// No description provided for @paymentNotCompleted.
  ///
  /// In es, this message translates to:
  /// **'Pago no completado'**
  String get paymentNotCompleted;

  /// No description provided for @paymentError.
  ///
  /// In es, this message translates to:
  /// **'Error procesando pago: {error}'**
  String paymentError(String error);

  /// No description provided for @checkingPaymentTitle.
  ///
  /// In es, this message translates to:
  /// **'Comprobando pago'**
  String get checkingPaymentTitle;

  /// No description provided for @categoryTitle.
  ///
  /// In es, this message translates to:
  /// **'Herramientas'**
  String get categoryTitle;

  /// No description provided for @searchCategory.
  ///
  /// In es, this message translates to:
  /// **'Buscar categoría...'**
  String get searchCategory;

  /// No description provided for @catalogYear.
  ///
  /// In es, this message translates to:
  /// **'CATÁLOGO 2026'**
  String get catalogYear;

  /// No description provided for @categoryHeaderTitle.
  ///
  /// In es, this message translates to:
  /// **'ENCUENTRA TODO LO'**
  String get categoryHeaderTitle;

  /// No description provided for @categoryHeaderSubtitle.
  ///
  /// In es, this message translates to:
  /// **'QUE NECESITAS'**
  String get categoryHeaderSubtitle;

  /// No description provided for @categoryHeaderDesc.
  ///
  /// In es, this message translates to:
  /// **'Explora nuestras categorías y encuentra las mejores herramientas.'**
  String get categoryHeaderDesc;

  /// No description provided for @categoriesLabel.
  ///
  /// In es, this message translates to:
  /// **'Categorías'**
  String get categoriesLabel;

  /// No description provided for @seeAll.
  ///
  /// In es, this message translates to:
  /// **'Ver todas'**
  String get seeAll;

  /// No description provided for @productListTitle.
  ///
  /// In es, this message translates to:
  /// **'Lista de Productos'**
  String get productListTitle;

  /// No description provided for @editProfileTitle.
  ///
  /// In es, this message translates to:
  /// **'Editar Perfil'**
  String get editProfileTitle;

  /// No description provided for @username.
  ///
  /// In es, this message translates to:
  /// **'Usuario'**
  String get username;

  /// No description provided for @correo.
  ///
  /// In es, this message translates to:
  /// **'Correo'**
  String get correo;

  /// No description provided for @telefono.
  ///
  /// In es, this message translates to:
  /// **'Teléfono'**
  String get telefono;

  /// No description provided for @saveChanges.
  ///
  /// In es, this message translates to:
  /// **'Guardar Cambios'**
  String get saveChanges;

  /// No description provided for @noChanges.
  ///
  /// In es, this message translates to:
  /// **'No hiciste cambios'**
  String get noChanges;

  /// No description provided for @aboutTitle.
  ///
  /// In es, this message translates to:
  /// **'Acerca de Nosotros'**
  String get aboutTitle;

  /// No description provided for @aboutSince.
  ///
  /// In es, this message translates to:
  /// **'Ferremateriales DGC · Desde 2010'**
  String get aboutSince;

  /// No description provided for @aboutWhoWeAre.
  ///
  /// In es, this message translates to:
  /// **'¿Quiénes somos?'**
  String get aboutWhoWeAre;

  /// No description provided for @aboutWhoWeAreContent.
  ///
  /// In es, this message translates to:
  /// **'Ferremateriales DGC es una empresa colombiana dedicada a la venta de materiales de construcción, herramientas y acabados para el hogar. Nacimos con el propósito de acercar los mejores productos del sector ferretero a nuestros clientes de forma rápida y confiable.'**
  String get aboutWhoWeAreContent;

  /// No description provided for @aboutMission.
  ///
  /// In es, this message translates to:
  /// **'Nuestra misión'**
  String get aboutMission;

  /// No description provided for @aboutMissionContent.
  ///
  /// In es, this message translates to:
  /// **'Proveer materiales de construcción y ferretería de alta calidad, ofreciendo una experiencia de compra ágil, segura y accesible, tanto en nuestra tienda física como a través de nuestra aplicación móvil.'**
  String get aboutMissionContent;

  /// No description provided for @aboutVision.
  ///
  /// In es, this message translates to:
  /// **'Nuestra visión'**
  String get aboutVision;

  /// No description provided for @aboutVisionContent.
  ///
  /// In es, this message translates to:
  /// **'Ser la ferretería de referencia en la región, reconocida por la calidad de nuestros productos, la excelencia en el servicio al cliente y nuestra capacidad de innovación digital.'**
  String get aboutVisionContent;

  /// No description provided for @aboutValues.
  ///
  /// In es, this message translates to:
  /// **'Nuestros valores'**
  String get aboutValues;

  /// No description provided for @aboutValuesContent.
  ///
  /// In es, this message translates to:
  /// **'Confianza, honestidad y compromiso guían cada una de nuestras acciones. Creemos en relaciones duraderas con nuestros clientes, proveedores y colaboradores, basadas en el respeto y la transparencia.'**
  String get aboutValuesContent;

  /// No description provided for @aboutWhyUs.
  ///
  /// In es, this message translates to:
  /// **'¿Por qué elegirnos?'**
  String get aboutWhyUs;

  /// No description provided for @aboutWhyUsContent.
  ///
  /// In es, this message translates to:
  /// **'Contamos con un amplio catálogo de productos, precios competitivos, asesoría personalizada y entregas a domicilio. Nuestra app te permite explorar categorías, gestionar tus pedidos y contactarnos en cualquier momento.'**
  String get aboutWhyUsContent;

  /// No description provided for @aboutContact.
  ///
  /// In es, this message translates to:
  /// **'Contáctanos'**
  String get aboutContact;

  /// No description provided for @aboutContactContent.
  ///
  /// In es, this message translates to:
  /// **'¿Tienes alguna pregunta o sugerencia? Escríbenos a contacto@ferremateriales.com o visítanos en nuestra tienda. Estamos aquí para ayudarte.'**
  String get aboutContactContent;

  /// No description provided for @helpCenterTitle.
  ///
  /// In es, this message translates to:
  /// **'Centro de ayuda'**
  String get helpCenterTitle;

  /// No description provided for @faqLabel.
  ///
  /// In es, this message translates to:
  /// **'Preguntas frecuentes'**
  String get faqLabel;

  /// No description provided for @faqSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Encuentra respuestas a las dudas más comunes'**
  String get faqSubtitle;

  /// No description provided for @faq1Q.
  ///
  /// In es, this message translates to:
  /// **'¿Cómo realizo un pedido?'**
  String get faq1Q;

  /// No description provided for @faq1A.
  ///
  /// In es, this message translates to:
  /// **'Agrega productos al carrito y sigue los pasos de pago desde la sección Carrito.'**
  String get faq1A;

  /// No description provided for @faq2Q.
  ///
  /// In es, this message translates to:
  /// **'¿Cuáles son los métodos de pago?'**
  String get faq2Q;

  /// No description provided for @faq2A.
  ///
  /// In es, this message translates to:
  /// **'Aceptamos tarjeta débito, crédito y transferencia bancaria.'**
  String get faq2A;

  /// No description provided for @faq3Q.
  ///
  /// In es, this message translates to:
  /// **'¿Cuánto tarda el envío?'**
  String get faq3Q;

  /// No description provided for @faq3A.
  ///
  /// In es, this message translates to:
  /// **'El envío estándar tarda entre 2 y 5 días hábiles según tu ubicación.'**
  String get faq3A;

  /// No description provided for @faq4Q.
  ///
  /// In es, this message translates to:
  /// **'¿Puedo cancelar un pedido?'**
  String get faq4Q;

  /// No description provided for @faq4A.
  ///
  /// In es, this message translates to:
  /// **'Sí, puedes cancelar un pedido antes de que sea despachado desde la sección Pedidos.'**
  String get faq4A;

  /// No description provided for @faq5Q.
  ///
  /// In es, this message translates to:
  /// **'¿Cómo contacto al soporte?'**
  String get faq5Q;

  /// No description provided for @faq5A.
  ///
  /// In es, this message translates to:
  /// **'Puedes escribirnos a soporte@ferremateriales.com o llamar al 300 123 4567.'**
  String get faq5A;

  /// No description provided for @termsTitle.
  ///
  /// In es, this message translates to:
  /// **'Términos y condiciones'**
  String get termsTitle;

  /// No description provided for @termsLastUpdate.
  ///
  /// In es, this message translates to:
  /// **'Última actualización: junio 2025'**
  String get termsLastUpdate;

  /// No description provided for @terms1Title.
  ///
  /// In es, this message translates to:
  /// **'1. Aceptación de los términos'**
  String get terms1Title;

  /// No description provided for @terms1Content.
  ///
  /// In es, this message translates to:
  /// **'Al usar esta aplicación, aceptas estos términos en su totalidad. Si no estás de acuerdo, por favor no uses el servicio.'**
  String get terms1Content;

  /// No description provided for @terms2Title.
  ///
  /// In es, this message translates to:
  /// **'2. Uso del servicio'**
  String get terms2Title;

  /// No description provided for @terms2Content.
  ///
  /// In es, this message translates to:
  /// **'Esta plataforma es exclusiva para la compra de productos de ferretería y materiales de construcción. Queda prohibido el uso indebido o con fines ilícitos.'**
  String get terms2Content;

  /// No description provided for @terms3Title.
  ///
  /// In es, this message translates to:
  /// **'3. Cuenta de usuario'**
  String get terms3Title;

  /// No description provided for @terms3Content.
  ///
  /// In es, this message translates to:
  /// **'Eres responsable de mantener la confidencialidad de tus credenciales. Notifícanos de inmediato ante cualquier uso no autorizado de tu cuenta.'**
  String get terms3Content;

  /// No description provided for @terms4Title.
  ///
  /// In es, this message translates to:
  /// **'4. Precios y pagos'**
  String get terms4Title;

  /// No description provided for @terms4Content.
  ///
  /// In es, this message translates to:
  /// **'Los precios están expresados en pesos colombianos e incluyen IVA. Nos reservamos el derecho de modificar precios sin previo aviso.'**
  String get terms4Content;

  /// No description provided for @terms5Title.
  ///
  /// In es, this message translates to:
  /// **'5. Cancelaciones y devoluciones'**
  String get terms5Title;

  /// No description provided for @terms5Content.
  ///
  /// In es, this message translates to:
  /// **'Puedes cancelar un pedido antes de su despacho. Las devoluciones se gestionan dentro de los 5 días hábiles siguientes a la entrega.'**
  String get terms5Content;

  /// No description provided for @terms6Title.
  ///
  /// In es, this message translates to:
  /// **'6. Contacto'**
  String get terms6Title;

  /// No description provided for @terms6Content.
  ///
  /// In es, this message translates to:
  /// **'Para consultas sobre estos términos escríbenos a legal@ferremateriales.com.'**
  String get terms6Content;

  /// No description provided for @privacyTitle.
  ///
  /// In es, this message translates to:
  /// **'Política de privacidad'**
  String get privacyTitle;

  /// No description provided for @privacyLastUpdate.
  ///
  /// In es, this message translates to:
  /// **'Última actualización: junio 2025'**
  String get privacyLastUpdate;

  /// No description provided for @privacy1Title.
  ///
  /// In es, this message translates to:
  /// **'Datos que recopilamos'**
  String get privacy1Title;

  /// No description provided for @privacy1Content.
  ///
  /// In es, this message translates to:
  /// **'Recopilamos nombre, correo electrónico, dirección de entrega y datos de uso de la app para brindarte una mejor experiencia.'**
  String get privacy1Content;

  /// No description provided for @privacy2Title.
  ///
  /// In es, this message translates to:
  /// **'Uso de la información'**
  String get privacy2Title;

  /// No description provided for @privacy2Content.
  ///
  /// In es, this message translates to:
  /// **'Usamos tus datos para procesar pedidos, personalizar tu experiencia y enviarte notificaciones relevantes. Nunca vendemos tu información a terceros.'**
  String get privacy2Content;

  /// No description provided for @privacy3Title.
  ///
  /// In es, this message translates to:
  /// **'Almacenamiento y seguridad'**
  String get privacy3Title;

  /// No description provided for @privacy3Content.
  ///
  /// In es, this message translates to:
  /// **'Tu información se almacena en servidores seguros con cifrado. Aplicamos medidas técnicas y organizativas para proteger tus datos.'**
  String get privacy3Content;

  /// No description provided for @privacy4Title.
  ///
  /// In es, this message translates to:
  /// **'Tus derechos'**
  String get privacy4Title;

  /// No description provided for @privacy4Content.
  ///
  /// In es, this message translates to:
  /// **'Tienes derecho a acceder, corregir o eliminar tus datos personales. Puedes ejercerlos escribiéndonos a privacidad@ferremateriales.com.'**
  String get privacy4Content;

  /// No description provided for @privacy5Title.
  ///
  /// In es, this message translates to:
  /// **'Cookies'**
  String get privacy5Title;

  /// No description provided for @privacy5Content.
  ///
  /// In es, this message translates to:
  /// **'Usamos cookies para mejorar el rendimiento de la app. Puedes desactivarlas desde la configuración de tu dispositivo.'**
  String get privacy5Content;

  /// No description provided for @contactTitle.
  ///
  /// In es, this message translates to:
  /// **'Contacto / Soporte'**
  String get contactTitle;

  /// No description provided for @contactSubtitle.
  ///
  /// In es, this message translates to:
  /// **'Estamos aquí para ayudarte'**
  String get contactSubtitle;

  /// No description provided for @contactHelpTitle.
  ///
  /// In es, this message translates to:
  /// **'¿En qué podemos ayudarte?'**
  String get contactHelpTitle;

  /// No description provided for @contactHelpContent.
  ///
  /// In es, this message translates to:
  /// **'Nuestro equipo de soporte está disponible para resolver tus dudas sobre pedidos, productos, entregas o cualquier inconveniente que tengas con la app.'**
  String get contactHelpContent;

  /// No description provided for @contactScheduleTitle.
  ///
  /// In es, this message translates to:
  /// **'Horario de atención'**
  String get contactScheduleTitle;

  /// No description provided for @contactScheduleContent.
  ///
  /// In es, this message translates to:
  /// **'Lunes a viernes de 8:00 a.m. a 6:00 p.m.\nSábados de 8:00 a.m. a 1:00 p.m.\nDomingos y festivos: cerrado.'**
  String get contactScheduleContent;

  /// No description provided for @contactChannels.
  ///
  /// In es, this message translates to:
  /// **'Canales de contacto'**
  String get contactChannels;

  /// No description provided for @contactEmail.
  ///
  /// In es, this message translates to:
  /// **'Correo electrónico'**
  String get contactEmail;

  /// No description provided for @contactPhone.
  ///
  /// In es, this message translates to:
  /// **'Teléfono / WhatsApp'**
  String get contactPhone;

  /// No description provided for @contactVisit.
  ///
  /// In es, this message translates to:
  /// **'Visítanos'**
  String get contactVisit;

  /// No description provided for @contactVisitAddress.
  ///
  /// In es, this message translates to:
  /// **'Cra. 10 #45-30, Barranquilla, Colombia'**
  String get contactVisitAddress;

  /// No description provided for @contactWhatsapp.
  ///
  /// In es, this message translates to:
  /// **'Chatear por WhatsApp'**
  String get contactWhatsapp;

  /// No description provided for @myAccount.
  ///
  /// In es, this message translates to:
  /// **'Mi cuenta'**
  String get myAccount;

  /// No description provided for @noCategoriesFound.
  ///
  /// In es, this message translates to:
  /// **'No se encontraron categorías'**
  String get noCategoriesFound;

  /// No description provided for @categoryLabel.
  ///
  /// In es, this message translates to:
  /// **'Categoría'**
  String get categoryLabel;

  /// No description provided for @bannerOffer.
  ///
  /// In es, this message translates to:
  /// **'Oferta especial'**
  String get bannerOffer;

  /// No description provided for @banner1Title.
  ///
  /// In es, this message translates to:
  /// **'Hasta 30% OFF'**
  String get banner1Title;

  /// No description provided for @banner1Subtitle.
  ///
  /// In es, this message translates to:
  /// **'En herramientas'**
  String get banner1Subtitle;

  /// No description provided for @banner2Title.
  ///
  /// In es, this message translates to:
  /// **'Nuevos productos'**
  String get banner2Title;

  /// No description provided for @banner2Subtitle.
  ///
  /// In es, this message translates to:
  /// **'Para construcción'**
  String get banner2Subtitle;

  /// No description provided for @banner3Title.
  ///
  /// In es, this message translates to:
  /// **'Grandes descuentos'**
  String get banner3Title;

  /// No description provided for @banner3Subtitle.
  ///
  /// In es, this message translates to:
  /// **'Solo esta semana'**
  String get banner3Subtitle;

  /// No description provided for @categoryBathroomName.
  ///
  /// In es, this message translates to:
  /// **'Baños'**
  String get categoryBathroomName;

  /// No description provided for @categoryBathroomDesc.
  ///
  /// In es, this message translates to:
  /// **'Griferia, regaderas, accesorios y más'**
  String get categoryBathroomDesc;

  /// No description provided for @categoryFloorsName.
  ///
  /// In es, this message translates to:
  /// **'Pisos'**
  String get categoryFloorsName;

  /// No description provided for @categoryFloorsDesc.
  ///
  /// In es, this message translates to:
  /// **'Cerámicos, porcelanatos y madera'**
  String get categoryFloorsDesc;

  /// No description provided for @categoryConstructionName.
  ///
  /// In es, this message translates to:
  /// **'Construcción'**
  String get categoryConstructionName;

  /// No description provided for @categoryConstructionDesc.
  ///
  /// In es, this message translates to:
  /// **'Cemento, varilla y materiales básicos'**
  String get categoryConstructionDesc;

  /// No description provided for @categoryElectricalName.
  ///
  /// In es, this message translates to:
  /// **'Electricidad'**
  String get categoryElectricalName;

  /// No description provided for @categoryElectricalDesc.
  ///
  /// In es, this message translates to:
  /// **'Cables, interruptores y más'**
  String get categoryElectricalDesc;

  /// No description provided for @orderNumber.
  ///
  /// In es, this message translates to:
  /// **'Pedido #{id}'**
  String orderNumber(String id);

  /// No description provided for @productsCount.
  ///
  /// In es, this message translates to:
  /// **'Productos: {count}'**
  String productsCount(int count);

  /// No description provided for @orderTotal.
  ///
  /// In es, this message translates to:
  /// **'Total: {total}'**
  String orderTotal(String total);

  /// No description provided for @statusPaid.
  ///
  /// In es, this message translates to:
  /// **'pagado'**
  String get statusPaid;

  /// No description provided for @statusPending.
  ///
  /// In es, this message translates to:
  /// **'pendiente'**
  String get statusPending;

  /// No description provided for @statusFailed.
  ///
  /// In es, this message translates to:
  /// **'fallido'**
  String get statusFailed;

  /// No description provided for @noDescription.
  ///
  /// In es, this message translates to:
  /// **'Sin descripción disponible'**
  String get noDescription;

  /// No description provided for @addToCart.
  ///
  /// In es, this message translates to:
  /// **'Agregar al carrito'**
  String get addToCart;

  /// No description provided for @productAddedToCart.
  ///
  /// In es, this message translates to:
  /// **'Producto agregado al carrito'**
  String get productAddedToCart;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
