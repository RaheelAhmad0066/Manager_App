import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Language extends Translations {
  static const String _selectedLocaleKey =
      'selected_locale'; // Key for storing the selected locale

// Method to set the selected locale in shared preferences
  static Future<void> setSelectedLocale(String locale) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(_selectedLocaleKey, locale);
    } catch (e) {
      print("Error setting locale: $e");
    }
  }

// Method to get the selected locale from shared preferences
  static Future<String> getSelectedLocale() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString(_selectedLocaleKey) ??
          'en_US'; // Default locale if not set
    } catch (e) {
      print("Error getting locale: $e");
      return 'en_US'; // Return default locale in case of an error
    }
  }

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          "Apbartitle": "Talk ",
          "Apbartitle1": "with Gerente-A",
          "Hometitle": "Gerente-A",
          "Hometitlebox1":
              "Gerente-A It is an artificial intelligence created thanks to the technology of Dante.AI",
          "Hometitlebox2":
              "Gerente-A He has been trained by a law specialist to help Mercadona workers.",
          "Hometitlebox3":
              "Emapuedes request to consult private and written applications in infogerentea@gmail.comil",
          "Textfieldhint": "Start Chat",
          "Clearchat": "Clear Chat",
          "Logout": "Logout",
          'emaildata': 'Enter your email',
          'sendmail': 'Send mail',
          'mess': 'Write a message',
          'snack': 'Your Email Send Succefully',
          'upda': 'Update',
          'canc': 'Cancle',
          'up': 'Please Upgrade Your Plan',
          'start': 'Getting started with',
          'lu': 'Try out different language prompts and modes.',
          "Home": "Home",
          "FAQs": "FAQs",
          "Chatsupport": "Legal Advice",
          "Aboutapp": "About App",
          "Language": "Language Change",
          "Premium": "Premium Features",
          "Privacy Policy": "Privacy Policy",
          'Faqtitle': 'FAQs',
          'faqQuest': 'What is the purpose of the APP Manager A?',
          'faqanswer':
              'The Manager A application was created so that Mercadona workers would have a tool where they could consult their labor rights and everything related to their collective agreement, with a more pleasant language, without so much legal technicality.',
          'faqquest2':
              'Are the answers provided by Manager A both in the chatbot and through Consulting legallyvlid?',
          'feqanswer':
              'No, all the answers provided by the Chatbot, as well as by the Consultancy, are for educational purposes, and cannot be used for claims, demands or illegal actions of any kind.The manement company of Manager A is not responsible for the actions carried out by the worker with the answers provided within the APP, such as by Advice via email.',
          'faqquestion3':
              'What is the best way to ask the questions to the Artificial Intelligence Chatbot? What kind of questions is recommended to ask the Chatbot?',
          'faqanswer3':
              ' To get the best out of the artificial intelligence Chatbot, we recommend that you be as precise as possible, do not use a language that is not accepted by the country s linguistic authorities. Although Artificial Intelligence interprets and analyzes human language, it is preferable to be as explicit as possible and expose as many details as you think may be important. Example: "How many days off do I get if my brother is operated on?", "What should I do if I think I m being bullied at work?", "Can I use a colleague s username in my cashier position? ”.',
          'bypremium': 'By Premium',
          'Yearly': 'Yearly Payment',
          'heading': 'PRIVACY POLICY',
          'privacy1':
              'Date of last update: August 2023 In accordance with Regulation (EU) 2016/679, of the European Parliament and of the Council, of April 27, 2016, regarding the protection of natural persons with regard to the processing of personal data and the free circulation of these data (General Data Protection Regulation-RGPD), AEA INTERNATIONAL SERVICES LLC, informs the users of the GERENTEA application (hereinafter, the Application), about the processing of personal data, which they have voluntarily provided during the registration process, access and use of the service.',
          'privacy2Q': 'DENTIFICATION OF THE DATA CONTROLLER.',
          'privacy2A':
              'AEA INTERNATIONAL SERVICE LLC, Delaware (USA), (hereinafter, the Data Controller), is the entity responsible for processing the data provided by the customers of the Application (hereinafter, the User/s).',
          'privacy3Q': '.PURPOSE OF DATA PROCESSING',
          'privacy3A':
              'To proceed with the registration, access and subsequent use of the Application, the User must voluntarily provide personal data (essentially identification and contact information), which will be incorporated into automated media owned by AEA INTERNATIONAL SERVICES LLC.\n\n The collection, storage, modification, structuring and, where appropriate, deletion, of the data provided by Users, will constitute processing operations carried out by the Responsible Party, with the purpose of guaranteeing the correct functioning of the Application, maintaining the relationship of provision of services and /n or commercial with the User, and for the management, administration, information, provision and improvement of the service.\n\nThe personal data provided by the User -especially electronic mail or e-mail- may also be used to send bulletins (newsletters), as well as commercial communications of promotions and/or advertising of the Application, as long as the User has provided prior express consent to receive these communications electronically.',
          'privacu4Q': 'EXERCISE OF RIGHTS.',
          'privacu4A':
              'AEA INTERNATIONAL SERVICES LLC, informs the User that they have the rights of access, rectification, limitation, deletion, opposition and portability, which may be exercised by request addressed to the email: aeainternationalservices@gmail.com\n\n Likewise, the User has the right to revoke the consent initially given, and to file rights claims against the Spanish Agency for Data Protection (AEPD)',
          'yearly': 'Yearly',
          'ragister': 'Register to meet\n',
          'reg': 'Register',
          'Logi': 'Login',
          'Aboutappa': 'About',
          'data':
              '. The APP and its contents (texts, photographs, graphics, images, technology, software, links, contents, graphic design, source code, etc.), as well as the brands and other distinctive signs are the property of AEA INTERNATIONAL SERVICES LLC or of third parties, the User not acquiring any right over them by the mere use of the APP. The User must refrain from: a) Reproducing, copying, distributing, making available to third parties, publicly communicating, transforming or modifying the APP or its contents, except in the cases contemplated by law or expressly authorized by AEA INTERNATIONAL SERVICES LLC or by the owner of said rights. b) Reproduce or copy the APP or its contents for private use, as well as communicate them publicly or make them available to third parties when this entails their reproduction. c) Extract or reuse all or a substantial part of the contents of the APP.\n\nProtection of your personal information: we want to help you carry out all the necessary steps to protect your privacy and information. Consult the Privacy Policy of AEA INTERNATIONAL SERVICES LLC. The GerenteA App does not collect information of any kind, all the information entered by users will be used as an anonymous person.\n\n The APP and its contents (texts, photographs, graphics, images, technology, software, links, contents, graphic design, source code, etc.), as well as the brands and other distinctive signs are the property of AEA INTERNATIONAL SERVICES LLC or of third parties, the User not acquiring any right over them by the mere use of the APP. The User must refrain from: a) Reproducing, copying, distributing, making available to third parties, publicly communicating,transforming or modifying the APP or its contents, except in the cases contemplated by law or expressly authorized by AEA INTERNATIONAL SERVICES LLC or by the owner of said rights. b) Reproduce or copy the APP or its contents for private use, as well as communicate them publicly or make them available to third parties when this entails their reproduction. c) Extract or reuse all or a substantial part of the contents of the APP.',
          'createa': 'Create Account :)',
          'entnam': 'Enter Name',
          'entemail': 'Enter Email Id',
          'Enetpas': 'Enter Password',
          'Sign': 'Sign Up',
          'already': 'Already have an account',
          'continue': 'Continue',
          'aa': 'If you have an account, Just click on',
          'welcome': 'Welcome Back!',
          'enter': 'Enter Your Email & Password',
          'new': 'Create a New Account',
          'features': 'Features:',
          'unlimited': 'Basic version 47,99€\nUnlimited questions',
          'unli':
              'Premium version 97,99€\nUnlimited questions + 2 legal advices',
          'continu': 'Continue',
          'restore': 'Restore',
          'terms': 'Terms of Use',
          'an': 'and',
          'pr': 'Privacy Policy',
          'faq4':
              'Who has access to the information I provide in the application?',
          'faqanswer4':
              ' No one has access to your information. Although we have a privacy policy, it is due to legal obligations within the European Union, but we do not store personal data of users. The data you use to pay for the application is managed by the platform companies, the questions you ask in the chatbot and in the Advice are made anonymously, without asking for names, in addition to the fact that the data entered in the Chatbot is protected by OpenAI and AWS, in the US.',
          'privacytext':
              ' Your Privacy Policy Text Goes Here\nThis is where you should provide detailed information about your data collection, usage, and storage policies.\nYou may want to include information about:\n- What data you collect (e.g., user messages, user information\n- How you use the collected data\n- How you store and protect the data\n- Third-party services and their privacy policies (if applicable)\n- User consent and optout options\n- Contact information for privacy-related inquiries\n\nRemember to comply with relevant privacy laws and regulations.'
        },
        'es_ES': {
          "Apbartitle": "Hablar ",
          "Apbartitle1": "con Gerente-A",
          "Hometitle": "Gerente-A",
          'Logi': 'acceso',
          'start': 'empezar con',
          'lu': 'Pruebe diferentes indicaciones y modos de idioma.',
          "Hometitlebox1":
              "Gerente-A es una inteligencia artificial creada gracias a la tecnología de Dante.AI",
          "Hometitlebox2":
              "Gerente-A ha sido entrenada por especialista en derecho para ayudar a los trabajadores de Mercadona.",
          "Hometitlebox3":
              "'ema' Puedes solicitar consultar privadas y escritos de solicitudes en infogerentea@gmail.comil",
          "Textfieldhint": "Comenzar chat",
          "Clearchat": "Vacie la conversacion",
          'Aboutappa': 'Acerca de',
          'data':
              '. La APP y sus contenidos (textos, fotografías, gráficos, imágenes, tecnología, software, enlaces, contenidos, diseño gráfico, código fuente, etc.), así como las marcas y demás signos distintivos son propiedad de AEA INTERNATIONAL SERVICES LLC o de terceros, no adquiriendo el Usuario ningún derecho sobre los mismos por el mero uso de la APP. El Usuario deberá abstenerse de: a) Reproducir, copiar, distribuir, poner a disposición de terceros, comunicar públicamente, transformar o modificar la APP o sus contenidos, salvo en los casos contemplados por la ley o expresamente autorizados por AEA INTERNATIONAL SERVICES LLC o por la titular de dichos derechos. b) Reproducir o copiar la APP o sus contenidos para uso privado, así como comunicarlos públicamente o ponerlos a disposición de terceros cuando ello implique su reproducción. c) Extraer o reutilizar todo o una parte sustancial del contenido de la APP.\n\nProtección de tu información personal: queremos ayudarte a realizar todos los pasos necesarios para proteger tu privacidad e información. Consulte la Política de Privacidad de AEA INTERNATIONAL SERVICES LLC. La App GerenteA no recopila información de ningún tipo, toda la información ingresada por los usuarios será utilizada de forma anónima.\n\nLa APP y sus contenidos (textos, fotografías, gráficos, imágenes, tecnología, software, enlaces, contenidos, diseño gráfico, código fuente, etc.), así como las marcas y demás signos distintivos son propiedad de AEA INTERNATIONAL SERVICES LLC o de terceros, no adquiriendo el Usuario ningún derecho sobre los mismos por el mero uso de la APP. El Usuario deberá abstenerse de: a) Reproducir, copiar, distribuir, poner a disposición de terceros, comunicar públicamente, transformar o modificar la APP o sus contenidos, salvo en los casos contemplados por la ley o expresamente autorizados por AEA INTERNATIONAL SERVICES LLC o por la titular de dichos derechos. b) Reproducir o copiar la APP o sus contenidos para uso privado, así como comunicarlos públicamente o ponerlos a disposición de terceros cuando ello implique su reproducción. c) Extraer o reutilizar la totalidad o una parte sustancial de los contenidos de la APP.',
          "Logout": "Cerrar sesión",
          "Home": "Hogar",
          'emaildata': 'Introduce tu correo electrónico',
          'sendmail': 'Enviar correo',
          'mess': 'Escribe un mensaje',
          'snack': 'Su correo electrónico se envió con éxito',
          'upda': 'Actualizar',
          'canc': 'Cancelar',
          'up': 'Actualice su plan',
          'ragister': 'Regístrese para reunirse \n',
          'aa': 'Si tiene una cuenta, simplemente haga clic en',
          'reg': 'Regístrese',
          'createa': 'Crear una cuenta :)',
          'entnam': 'Ingrese su nombre',
          'entemail': 'Ingrese ID de correo electrónico',
          'Enetpas': 'Introducir la contraseña',
          'Sign': 'Inscribirse',
          'already': 'Ya tienes una cuenta',
          'continue': 'Continuar',
          'welcome': '¡Bienvenido de nuevo!',
          'enter': 'Ingrese su correo electrónico y contraseña',
          'new': 'Crea una cuenta nueva',
          "FAQs": "Preguntas frecuentes",
          'Faqtitle': 'Preguntas frecuentes',
          "Chatsupport": "Asesoría legal",
          "Aboutapp": "Acerca de la aplicación",
          "Language": "Cambio de idioma",
          "Premium": "Características premium",
          "Privacy Policy": "política de privacidad",
          'heading': 'POLÍTICA DE PRIVACIDAD',
          'privacy1':
              'Fecha de última actualización: Agosto 2023 De conformidad con el Reglamento (UE) 2016/679, del Parlamento Europeo y del Consejo, de 27 de abril de 2016, relativo a la protección de las personas físicas en lo que respecta al tratamiento de datos personales y a la libre circulación de estos datos (Reglamento General de Protección de Datos-RGPD), AEA INTERNATIONAL SERVICES LLC, informa a los usuarios de la aplicación GERENTEA (en adelante, la Aplicación), sobre el tratamiento de los datos personales, que han proporcionado voluntariamente durante el proceso de registro, acceso y uso del servicio.',
          'privacy2Q': 'IDENTIFICACIÓN DEL RESPONSABLE DEL TRATAMIENTO.',
          'privacy2A':
              'AEA INTERNATIONAL SERVICE LLC, Delaware (EE.UU.), (en adelante, el Responsable del tratamiento), es la entidad responsable del tratamiento de los datos facilitados por los clientes de la Aplicación (en adelante, el/los Usuario/s).',
          'privacy3Q': '. FINALIDAD DEL TRATAMIENTO DE DATOS',
          'privacy3A':
              'Para proceder al registro, acceso y posterior uso de la Aplicación, el Usuario deberá proporcionar voluntariamente datos personales (esencialmente identificación y datos de contacto), los cuales serán incorporados a medios automatizados propiedad de AEA INTERNATIONAL SERVICES LLC.\n\nLa recopilación, almacenamiento , modificación, estructuración y, en su caso, supresión, de los datos proporcionados por los Usuarios, constituirán operaciones de tratamiento realizadas por el Responsable, con la finalidad de garantizar el correcto funcionamiento de la Aplicación, mantener la relación de prestación de servicios y/o o comercial con el Usuario, y para la gestión, administración, información, prestación y mejora del servicio.\n\nLos datos personales proporcionados por el Usuario -especialmente el correo electrónico o correo electrónico- también podrán ser utilizados para el envío de boletines. (newsletters), así como comunicaciones comerciales de promociones y/o publicidad de la Aplicación, siempre que el Usuario haya prestado previamente su consentimiento expreso para recibir dichas comunicaciones por vía electrónica.',
          'privacu4Q': 'EJERCICIO DE DERECHOS.',
          'privacu4A':
              'AEA INTERNATIONAL SERVICES LLC, informa al Usuario que tiene los derechos de acceso, rectificación, limitación, supresión, oposición y portabilidad, los cuales podrá ejercitar mediante solicitud dirigida al correo electrónico: aeainternationalservices@gmail.com\n\n Asimismo, el Usuario tiene derecho a revocar el consentimiento inicialmente prestado, y a presentar reclamaciones de derechos frente a la Agencia Española de Protección de Datos (AEPD)',
          'faqQuest': '¿Cuál es la finalidad de la APP Gerente A?',
          'faqanswer':
              ' La aplicación Gerente A fue creada para quelos trabajadores de Mercadona tuvieran una herramienta donde poder consultar sus derechos laborales y todo lo relacionado con su convenio colectivo, con un lenguaje másameno, sin tanto tecnicismo legal.',
          'faqquest2':
              '¿Tienen validez legal las respuestas que proporciona Gerente A tanto en el chatbot,cómo por Asesoría?',
          'feqanswer':
              'No, todas las respuestas proporcionadas por el Chatbot, cómo por laAsesoría son con una finalidad didáctica, no puede utilizarse para reclamaciones,demandas o acciones ilegales de cualquier tipo. La empresa gestora de Gerente A no sehace responsable de las acciones llevadas a cabo por el trabajador con las respuestas proporcionadas dentro de la APP, cómo por Asesoramiento vía email.',
          'faqquestion3':
              '¿Cuál es la mejor forma de hacer las preguntas al Chatbot de Inteligencia Artificial?¿Qué tipo de preguntas se recomienda preguntar al Chatbot? ',
          'faqanswer3':
              ' Para sacar el mejor partido al Chatbot de inteligencia artificial les recomendamos que sean lo más precisos posibles, no utilicen un lenguaje que no esté aceptado por las autoridades lingüísticas del país. Aunque la Inteligencia Artificial interpreta y analiza el lenguaje humano, es preferible ser lo más explícito posible y exponer cuantos detalles crea que puedan ser importantes. Ejemplo: “¿Cuántos días libres me pertenecen si operan a mi hermano?”, “¿Qué debo hacer si creo que estoy sufriendo acoso laboral en el trabajo?”,”¿Puedo usar el usuario de un compañero en mi puesto de cajero?”.',
          'faq4':
              '¿Quién tiene acceso a la información que proporciono en la aplicación?',
          'faqanswer4':
              'Nadie tiene acceso a tu información. Aunque tengamos una política de privacidad, es por obligaciones legales dentro de la Unión Europa, pero no almacenamos datos personales de los usuarios. Los datos que utilizas para pagar la aplicación los gestiona las empresas de la plataforma, las preguntas que realizas en el chatbot y en el Asesoramiento se hacen de forma anónima, sin preguntar nombres, además que los datos introducidos en el Chatbot son protegidos por OpenAI y AWS, en EEUU.',
          'bypremium': 'Por premium',
          'Yearly': 'Pago anual',
          'yearly': 'Anual',
          'features': 'Características:',
          'unlimited': 'Versión básica 47,99€\nPreguntas ilimitadas',
          'unli':
              'Preguntas ilimitadas 97,99€\nPreguntas ilimitadas + 2 Consejo legal',
          'continu': 'Continuar',
          'restore': 'Restaurar',
          'terms': 'Condiciones de uso',
          'an': 'y',
          'privacytext':
              ' Su texto de Política de privacidad va aquí \n. Es donde debe proporcionar información detallada sobre su recopilación de datos, uso y políticas de almacenamiento. \n- Cómo utiliza los datos recopilados \n- cómo almacena y protege los servicios de terceros datos y sus políticas de privacidad (si corresponde) \n- Opciones de consentimiento de usuario y opciones de opción \n- Información de contacto para privacidad- Consultas relacionadas \n\n remember para cumplir con las leyes y reglamentos de privacidad relevantes.'
        }
      };
}
