import 'package:flutter/material.dart';

void main() {
  runApp(const WaslaApp());
}

class WaslaApp extends StatelessWidget {
  const WaslaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wasla',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF10131C),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF20C997),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void login() {
    if (formKey.currentState!.validate()) {
      final phone = '+20${phoneController.text.substring(1)}';

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('الرقم جاهز للتحقق: $phone'),
        ),
      );

      // الخطوة القادمة: إرسال كود SMS حقيقي باستخدام Firebase.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 35),

                    Center(
                      child: Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: const Color(0xFF20C997)
                              .withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: const Icon(
                          Icons.forum_rounded,
                          size: 48,
                          color: Color(0xFF20C997),
                        ),
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'وصلة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'خليك قريب من الناس اللي تهمك',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),

                    const SizedBox(height: 45),

                    const Text(
                      'أهلاً بيك 👋',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      'اكتب رقم موبايلك علشان تبدأ',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.white60,
                      ),
                    ),

                    const SizedBox(height: 24),

                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      maxLength: 11,
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 18),
                      decoration: InputDecoration(
                        counterText: '',
                        hintText: '01XXXXXXXXX',
                        prefixIcon: const Icon(Icons.phone_android),
                        prefixText: '+20  ',
                        filled: true,
                        fillColor: const Color(0xFF1B2030),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        final phone = value?.trim() ?? '';

                        if (!RegExp(
                          r'^01[0125][0-9]{8}$',
                        ).hasMatch(phone)) {
                          return 'اكتب رقم مصري صحيح من 11 رقم';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    SizedBox(
                      height: 56,
                      child: ElevatedButton(
                        onPressed: login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF20C997),
                          foregroundColor: const Color(0xFF10131C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'متابعة',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    const Text(
                      'بمتابعتك، أنت توافق على شروط الاستخدام '
                      'وسياسة الخصوصية.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}