import 'package:flutter/material';

void main() {
  runApp(const AcrobatCloneApp());
}

class AcrobatCloneApp extends StatelessWidget {
  const AcrobatCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isEnglish = true;

  final Map<String, Map<String, String>> localizedText = {
    'en': {
      'title': 'MS PDF PRO',
      'subtitle': 'Select a PDF to start editing',
      'btn_pick': 'Choose PDF File',
      'btn_crop': 'Crop PDF Page',
      'btn_merge': 'Merge PDFs',
      'lang_switch': 'हिंदी में बदलें',
    },
    'hi': {
      'title': 'एमएस पीडीएफ प्रो',
      'subtitle': 'एडिटिंग शुरू करने के लिए PDF चुनें',
      'btn_pick': 'PDF फाइल चुनें',
      'btn_crop': 'PDF पेज क्रॉप करें',
      'btn_merge': 'PDF फाइल्स जोड़ें',
      'lang_switch': 'Switch to English',
    }
  };

  @override
  Widget build(BuildContext context) {
    String currentLang = isEnglish ? 'en' : 'hi';

    return Scaffold(
      appBar: AppBar(
        title: Text(localizedText[currentLang]!['title']!),
        backgroundColor: Colors.redAccent,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                isEnglish = !isEnglish;
              });
            },
            child: Text(
              localizedText[currentLang]!['lang_switch']!,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.picture_as_pdf, size: 80, color: Colors.red),
            const SizedBox(height: 20),
            Text(
              localizedText[currentLang]!['subtitle']!,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              icon: const Icon(Icons.file_open),
              label: Text(localizedText[currentLang]!['btn_pick']!),
              onPressed: () {},
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              icon: const Icon(Icons.crop),
              label: Text(localizedText[currentLang]!['btn_crop']!),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(15),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              icon: const Icon(Icons.merge_type),
              label: Text(localizedText[currentLang]!['btn_merge']!),
              onPressed: () {},
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),
            ),
          ],
        ),
      ),
    );
  }
}
