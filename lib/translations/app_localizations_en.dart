// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Ferremateriales DGC';

  @override
  String get appSlogan => 'Your trusted hardware store';

  @override
  String get search => 'Search tools...';

  @override
  String noProductsFound(String query) {
    return 'No products found\nfor \"$query\"';
  }

  @override
  String results(int count) {
    return '$count result(s)';
  }

  @override
  String get featuredProducts => 'Featured Products';

  @override
  String get navHome => 'Home';

  @override
  String get navProducts => 'Products';

  @override
  String get navCategories => 'Categories';

  @override
  String get navFavorites => 'Favorites';

  @override
  String get navCart => 'Cart';

  @override
  String get navProfile => 'Profile';

  @override
  String get drawerHome => 'Home';

  @override
  String get drawerCategories => 'Categories';

  @override
  String get drawerProducts => 'Products';

  @override
  String get drawerCart => 'My Cart';

  @override
  String get drawerFavorites => 'My Favorites';

  @override
  String get drawerOrders => 'My Orders';

  @override
  String get drawerAccount => 'My Account';

  @override
  String get drawerAddresses => 'Addresses';

  @override
  String get drawerAbout => 'About Us';

  @override
  String get drawerSupport => 'Contact / Support';

  @override
  String get drawerLogout => 'Log Out';

  @override
  String get logoutTitle => 'Log out';

  @override
  String get logoutConfirm => 'Are you sure you want to leave?';

  @override
  String get cancel => 'Cancel';

  @override
  String get exit => 'Leave';

  @override
  String get loginTitle => 'Welcome back!';

  @override
  String get loginSubTitle =>
      'The best tools and materials to build your ideas';

  @override
  String get firstName => 'First name';

  @override
  String get lastName => 'Last name';

  @override
  String get email => 'Email address';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Sign in';

  @override
  String get createAccount => 'Create account';

  @override
  String get orSignInWith => 'Or sign in with';

  @override
  String get orSignUpWith => 'Or sign up with';

  @override
  String get iAgreeTo => 'I agree to the';

  @override
  String get privacyPolicy => 'Privacy policy';

  @override
  String get termsOfUse => 'Terms of use';

  @override
  String get and => 'and';

  @override
  String get titleRegister => 'Create your account';

  @override
  String get accountSettings => 'Account settings';

  @override
  String get profileTitle => 'Profile';

  @override
  String get profileSubtitle => 'Update your personal information';

  @override
  String get myAddresses => 'My addresses';

  @override
  String get myAddressesSubtitle => 'Add your delivery addresses';

  @override
  String get paymentMethods => 'Payment methods';

  @override
  String get paymentMethodsSubtitle => 'Manage your cards';

  @override
  String get security => 'Security';

  @override
  String get securitySubtitle => 'Change password';

  @override
  String get purchases => 'Purchases';

  @override
  String get myOrders => 'My orders';

  @override
  String get myOrdersSubtitle => 'Check your purchase history';

  @override
  String get myFavorites => 'Favorites';

  @override
  String get myFavoritesSubtitle => 'Saved products';

  @override
  String get coupons => 'Coupons';

  @override
  String get couponsSubtitle => 'Available discounts';

  @override
  String get preferences => 'Preferences';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsSubtitle => 'Configure alerts';

  @override
  String get language => 'Language';

  @override
  String get languageSubtitle => 'Select your language';

  @override
  String get darkMode => 'Dark mode';

  @override
  String get darkModeSubtitleOn => 'Dark appearance active';

  @override
  String get darkModeSubtitleOff => 'Change appearance';

  @override
  String get support => 'Support';

  @override
  String get helpCenter => 'Help center';

  @override
  String get helpCenterSubtitle => 'Support and frequently asked questions';

  @override
  String get termsAndConditions => 'Terms and conditions';

  @override
  String get termsAndConditionsSubtitle => 'Legal information';

  @override
  String get privacyPolicyTitle => 'Privacy policy';

  @override
  String get privacyPolicySubtitle => 'How we protect your data';

  @override
  String get logout => 'Log out';

  @override
  String get logoutSubtitle => 'Leave your account';

  @override
  String get ordersTitle => 'My orders';

  @override
  String get noOrders => 'You have no orders';

  @override
  String get favoritesTitle => 'My Favorites';

  @override
  String get noFavorites => 'You have no favorite products';

  @override
  String get noFavoritesHint => 'Tap the heart on products to add them!';

  @override
  String favoriteProducts(int count) {
    return 'Favorite products: $count';
  }

  @override
  String get inStock => 'In stock';

  @override
  String get profileUpdated => 'Profile updated successfully';

  @override
  String get addressesTitle => 'My addresses';

  @override
  String get addAddress => 'Add address';

  @override
  String get editAddress => 'Edit address';

  @override
  String get noAddresses => 'You have no saved addresses';

  @override
  String get recipientName => 'Recipient name';

  @override
  String get phone => 'Phone';

  @override
  String get department => 'Department';

  @override
  String get city => 'City';

  @override
  String get address => 'Address';

  @override
  String get reference => 'Reference';

  @override
  String get postalCode => 'Postal code';

  @override
  String get mainAddress => 'Main address';

  @override
  String get saveAddress => 'Save address';

  @override
  String get requiredField => 'Required field';

  @override
  String get principal => 'Main';

  @override
  String addressReference(String ref) {
    return 'Reference: $ref';
  }

  @override
  String get cartTitle => 'My Cart';

  @override
  String get emptyCart => 'Your cart is empty';

  @override
  String get emptyCartHint => 'Add products to continue';

  @override
  String quantity(int qty) {
    return 'Quantity: $qty';
  }

  @override
  String get total => 'Total';

  @override
  String get proceedToPayment => 'Proceed to payment';

  @override
  String get checkingPayment => 'Checking payment...';

  @override
  String get paymentConfirmed => 'Payment confirmed';

  @override
  String get paymentNotCompleted => 'Payment not completed';

  @override
  String paymentError(String error) {
    return 'Error processing payment: $error';
  }

  @override
  String get checkingPaymentTitle => 'Checking payment';

  @override
  String get categoryTitle => 'Tools';

  @override
  String get searchCategory => 'Search category...';

  @override
  String get catalogYear => 'CATALOG 2026';

  @override
  String get categoryHeaderTitle => 'FIND EVERYTHING';

  @override
  String get categoryHeaderSubtitle => 'YOU NEED';

  @override
  String get categoryHeaderDesc =>
      'Explore our categories and find the best tools.';

  @override
  String get categoriesLabel => 'Categories';

  @override
  String get seeAll => 'See all';

  @override
  String get productListTitle => 'Product List';

  @override
  String get editProfileTitle => 'Edit Profile';

  @override
  String get username => 'Username';

  @override
  String get correo => 'Email';

  @override
  String get telefono => 'Phone';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get noChanges => 'No changes made';

  @override
  String get aboutTitle => 'About Us';

  @override
  String get aboutSince => 'Ferremateriales DGC · Since 2010';

  @override
  String get aboutWhoWeAre => 'Who are we?';

  @override
  String get aboutWhoWeAreContent =>
      'Ferremateriales DGC is a Colombian company dedicated to the sale of construction materials, tools and home finishes. We were born with the purpose of bringing the best hardware products to our customers quickly and reliably.';

  @override
  String get aboutMission => 'Our mission';

  @override
  String get aboutMissionContent =>
      'To provide high quality construction materials and hardware, offering an agile, safe and accessible shopping experience, both in our physical store and through our mobile app.';

  @override
  String get aboutVision => 'Our vision';

  @override
  String get aboutVisionContent =>
      'To be the reference hardware store in the region, recognized for the quality of our products, excellence in customer service and our digital innovation capacity.';

  @override
  String get aboutValues => 'Our values';

  @override
  String get aboutValuesContent =>
      'Trust, honesty and commitment guide each of our actions. We believe in lasting relationships with our customers, suppliers and collaborators, based on respect and transparency.';

  @override
  String get aboutWhyUs => 'Why choose us?';

  @override
  String get aboutWhyUsContent =>
      'We have a wide product catalog, competitive prices, personalized advice and home deliveries. Our app lets you explore categories, manage your orders and contact us at any time.';

  @override
  String get aboutContact => 'Contact us';

  @override
  String get aboutContactContent =>
      'Do you have a question or suggestion? Write to us at contacto@ferremateriales.com or visit us at our store. We are here to help you.';

  @override
  String get helpCenterTitle => 'Help center';

  @override
  String get faqLabel => 'Frequently asked questions';

  @override
  String get faqSubtitle => 'Find answers to the most common questions';

  @override
  String get faq1Q => 'How do I place an order?';

  @override
  String get faq1A =>
      'Add products to the cart and follow the payment steps from the Cart section.';

  @override
  String get faq2Q => 'What are the payment methods?';

  @override
  String get faq2A => 'We accept debit card, credit card and bank transfer.';

  @override
  String get faq3Q => 'How long does shipping take?';

  @override
  String get faq3A =>
      'Standard shipping takes between 2 and 5 business days depending on your location.';

  @override
  String get faq4Q => 'Can I cancel an order?';

  @override
  String get faq4A =>
      'Yes, you can cancel an order before it is dispatched from the Orders section.';

  @override
  String get faq5Q => 'How do I contact support?';

  @override
  String get faq5A =>
      'You can write to us at soporte@ferremateriales.com or call 300 123 4567.';

  @override
  String get termsTitle => 'Terms and conditions';

  @override
  String get termsLastUpdate => 'Last updated: June 2025';

  @override
  String get terms1Title => '1. Acceptance of terms';

  @override
  String get terms1Content =>
      'By using this application, you accept these terms in full. If you disagree, please do not use the service.';

  @override
  String get terms2Title => '2. Use of service';

  @override
  String get terms2Content =>
      'This platform is exclusively for the purchase of hardware products and construction materials. Misuse or use for illegal purposes is prohibited.';

  @override
  String get terms3Title => '3. User account';

  @override
  String get terms3Content =>
      'You are responsible for maintaining the confidentiality of your credentials. Notify us immediately of any unauthorized use of your account.';

  @override
  String get terms4Title => '4. Prices and payments';

  @override
  String get terms4Content =>
      'Prices are expressed in Colombian pesos and include VAT. We reserve the right to modify prices without prior notice.';

  @override
  String get terms5Title => '5. Cancellations and returns';

  @override
  String get terms5Content =>
      'You can cancel an order before dispatch. Returns are managed within 5 business days following delivery.';

  @override
  String get terms6Title => '6. Contact';

  @override
  String get terms6Content =>
      'For inquiries about these terms write to us at legal@ferremateriales.com.';

  @override
  String get privacyTitle => 'Privacy policy';

  @override
  String get privacyLastUpdate => 'Last updated: June 2025';

  @override
  String get privacy1Title => 'Data we collect';

  @override
  String get privacy1Content =>
      'We collect name, email address, delivery address and app usage data to provide you with a better experience.';

  @override
  String get privacy2Title => 'Use of information';

  @override
  String get privacy2Content =>
      'We use your data to process orders, personalize your experience and send you relevant notifications. We never sell your information to third parties.';

  @override
  String get privacy3Title => 'Storage and security';

  @override
  String get privacy3Content =>
      'Your information is stored on secure encrypted servers. We apply technical and organizational measures to protect your data.';

  @override
  String get privacy4Title => 'Your rights';

  @override
  String get privacy4Content =>
      'You have the right to access, correct or delete your personal data. You can exercise them by writing to privacidad@ferremateriales.com.';

  @override
  String get privacy5Title => 'Cookies';

  @override
  String get privacy5Content =>
      'We use cookies to improve app performance. You can disable them from your device settings.';

  @override
  String get contactTitle => 'Contact / Support';

  @override
  String get contactSubtitle => 'We are here to help you';

  @override
  String get contactHelpTitle => 'How can we help you?';

  @override
  String get contactHelpContent =>
      'Our support team is available to resolve your questions about orders, products, deliveries or any inconvenience you have with the app.';

  @override
  String get contactScheduleTitle => 'Service hours';

  @override
  String get contactScheduleContent =>
      'Monday to Friday 8:00 a.m. to 6:00 p.m.\nSaturdays 8:00 a.m. to 1:00 p.m.\nSundays and holidays: closed.';

  @override
  String get contactChannels => 'Contact channels';

  @override
  String get contactEmail => 'Email';

  @override
  String get contactPhone => 'Phone / WhatsApp';

  @override
  String get contactVisit => 'Visit us';

  @override
  String get contactVisitAddress => 'Cra. 10 #45-30, Barranquilla, Colombia';

  @override
  String get contactWhatsapp => 'Chat on WhatsApp';

  @override
  String get myAccount => 'My account';

  @override
  String get noCategoriesFound => 'No categories found';

  @override
  String get categoryLabel => 'Category';

  @override
  String get bannerOffer => 'Special offer';

  @override
  String get banner1Title => 'Up to 30% OFF';

  @override
  String get banner1Subtitle => 'On tools';

  @override
  String get banner2Title => 'New products';

  @override
  String get banner2Subtitle => 'For construction';

  @override
  String get banner3Title => 'Big discounts';

  @override
  String get banner3Subtitle => 'This week only';

  @override
  String get categoryBathroomName => 'Bathrooms';

  @override
  String get categoryBathroomDesc => 'Faucets, showers, accessories and more';

  @override
  String get categoryFloorsName => 'Floors';

  @override
  String get categoryFloorsDesc => 'Ceramics, porcelain tiles and wood';

  @override
  String get categoryConstructionName => 'Construction';

  @override
  String get categoryConstructionDesc => 'Cement, rebar and basic materials';

  @override
  String get categoryElectricalName => 'Electrical';

  @override
  String get categoryElectricalDesc => 'Cables, switches and more';

  @override
  String orderNumber(String id) {
    return 'Order #$id';
  }

  @override
  String productsCount(int count) {
    return 'Products: $count';
  }

  @override
  String orderTotal(String total) {
    return 'Total: $total';
  }

  @override
  String get statusPaid => 'paid';

  @override
  String get statusPending => 'pending';

  @override
  String get statusFailed => 'failed';

  @override
  String get noDescription => 'No description available';

  @override
  String get addToCart => 'Add to cart';

  @override
  String get productAddedToCart => 'Product added to cart';

  @override
  String get forgotPasswordTitle => 'Forgot your password?';

  @override
  String get forgotPasswordSubtitle =>
      'Enter your email address and we will send you a link to reset your password.';

  @override
  String get forgotPasswordEmailLabel => 'Email address';

  @override
  String get forgotPasswordEmailHint => 'example@email.com';

  @override
  String get forgotPasswordEmailRequired => 'Please enter your email address';

  @override
  String get forgotPasswordEmailInvalid => 'Please enter a valid email address';

  @override
  String get forgotPasswordButton => 'Send reset link';
}
