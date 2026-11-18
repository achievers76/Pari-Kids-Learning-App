import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'lkg_maths_screen.dart';

void main() {
  runApp(const PariKidsLkgApp());
}

class PariKidsLkgApp extends StatelessWidget {
  const PariKidsLkgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pari Kids - ICSE LKG',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFFFF9C4),
      ),
      home: const LkgSyllabusHomeScreen(),
    );
  }
}

class VoiceHelper {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> speak(String text) async {
    await _tts.stop();
    await _tts.setLanguage("en-IN");
    await _tts.setPitch(1.25);
    await _tts.setSpeechRate(0.42);
    await _tts.speak(text);
  }
}

class LkgData {
  static const List> alphabet = [
    {"cap": "A", "small": "a", "word": "Apple", "phonics": "Aaa", "emoji": "🍎", "lottie": "https://assets2.lottiefiles.com/packages/lf20_touohxv0.json"},
    {"cap": "B", "small": "b", "word": "Ball", "phonics": "Buh", "emoji": "⚽", "lottie": "https://assets9.lottiefiles.com/packages/lf20_k86wxpgr.json"},
    {"cap": "C", "small": "c", "word": "Cat", "phonics": "Kuh", "emoji": "🐱", "lottie": "https://assets3.lottiefiles.com/packages/lf20_ot5g6v.json"},
    {"cap": "D", "small": "d", "word": "Dog", "phonics": "Duh", "emoji": "🐶", "lottie": "https://assets1.lottiefiles.com/packages/lf20_syqnfe7c.json"},
    {"cap": "E", "small": "e", "word": "Elephant", "phonics": "Eh", "emoji": "🐘", "lottie": "https://assets5.lottiefiles.com/packages/lf20_2cwDXD.json"},
    {"cap": "F", "small": "f", "word": "Fish", "phonics": "Fff", "emoji": "🐟", "lottie": "https://assets4.lottiefiles.com/packages/lf20_x62chJ.json"},
    {"cap": "G", "small": "g", "word": "Grapes", "phonics": "Guh", "emoji": "🍇", "lottie": "https://assets10.lottiefiles.com/packages/lf20_puciaact.json"},
    {"cap": "H", "small": "h", "word": "Hen", "phonics": "Huh", "emoji": "🐔", "lottie": "https://assets8.lottiefiles.com/packages/lf20_5tl1xxnz.json"},
    {"cap": "I", "small": "i", "word": "Ice-cream", "phonics": "Ih", "emoji": "🍦", "lottie": "https://assets6.lottiefiles.com/packages/lf20_kuhijlvx.json"},
    {"cap": "J", "small": "j", "word": "Joker", "phonics": "Juh", "emoji": "🃏", "lottie": "https://assets2.lottiefiles.com/packages/lf20_u4yrau.json"},
    {"cap": "K", "small": "k", "word": "Kite", "phonics": "Kuh", "emoji": "🪁", "lottie": "https://assets7.lottiefiles.com/packages/lf20_tll0j4bb.json"},
    {"cap": "L", "small": "l", "word": "Lion", "phonics": "Lll", "emoji": "🦁", "lottie": "https://assets1.lottiefiles.com/packages/lf20_lc46h4dr.json"},
    {"cap": "M", "small": "m", "word": "Mango", "phonics": "Mmm", "emoji": "🥭", "lottie": "https://assets3.lottiefiles.com/packages/lf20_y2hxiyxy.json"},
    {"cap": "N", "small": "n", "word": "Nest", "phonics": "Nnn", "emoji": "🪹", "lottie": "https://assets9.lottiefiles.com/packages/lf20_xlmz9xwm.json"},
    {"cap": "O", "small": "o", "word": "Orange", "phonics": "Aw", "emoji": "🍊", "lottie": "https://assets5.lottiefiles.com/packages/lf20_n9u2k4.json"},
    {"cap": "P", "small": "p", "word": "Parrot", "phonics": "Puh", "emoji": "🦜", "lottie": "https://assets4.lottiefiles.com/packages/lf20_8pL7DH.json"},
    {"cap": "Q", "small": "q", "word": "Queen", "phonics": "Kwuh", "emoji": "👑", "lottie": "https://assets2.lottiefiles.com/packages/lf20_touohxv0.json"},
    {"cap": "R", "small": "r", "word": "Rabbit", "phonics": "Rrr", "emoji": "🐰", "lottie": "https://assets10.lottiefiles.com/packages/lf20_s9614m.json"},
    {"cap": "S", "small": "s", "word": "Sun", "phonics": "Sss", "emoji": "☀️", "lottie": "https://assets6.lottiefiles.com/packages/lf20_xlky4kvh.json"},
    {"cap": "T", "small": "t", "word": "Tiger", "phonics": "Tuh", "emoji": "🐯", "lottie": "https://assets1.lottiefiles.com/packages/lf20_lc46h4dr.json"},
    {"cap": "U", "small": "u", "word": "Umbrella", "phonics": "Uh", "emoji": "☂️", "lottie": "https://assets8.lottiefiles.com/packages/lf20_5tl1xxnz.json"},
    {"cap": "V", "small": "v", "word": "Van", "phonics": "Vvv", "emoji": "🚐", "lottie": "https://assets3.lottiefiles.com/packages/lf20_x62chJ.json"},
    {"cap": "W", "small": "w", "word": "Watch", "phonics": "Wuh", "emoji": "⌚", "lottie": "https://assets9.lottiefiles.com/packages/lf20_k86wxpgr.json"},
    {"cap": "X", "small": "x", "word": "Xmas Tree", "phonics": "Ksss", "emoji": "🎄", "lottie": "https://assets7.lottiefiles.com/packages/lf20_tll0j4bb.json"},
    {"cap": "Y", "small": "y", "word": "Yo-Yo", "phonics": "Yuh", "emoji": "🪀", "lottie": "https://assets2.lottiefiles.com/packages/lf20_u4yrau.json"},
    {"cap": "Z", "small": "z", "word": "Zebra", "phonics": "Zzz", "emoji": "🦓", "lottie": "https://assets5.lottiefiles.com/packages/lf20_2cwDXD.json"},
  ];

  static const List> threeLetterWords = [
    {"word": "CAT", "letters": "C - A - T", "emoji": "🐱", "lottie": "https://assets3.lottiefiles.com/packages/lf20_ot5g6v.json"},
    {"word": "DOG", "letters": "D - O - G", "emoji": "🐶", "lottie": "https://assets1.lottiefiles.com/packages/lf20_syqnfe7c.json"},
    {"word": "SUN", "letters": "S - U - N", "emoji": "☀️", "lottie": "https://assets6.lottiefiles.com/packages/lf20_xlky4kvh.json"},
    {"word": "PEN", "letters": "P - E - N", "emoji": "🖊️", "lottie": "https://assets4.lottiefiles.com/packages/lf20_8pL7DH.json"},
    {"word": "CUP", "letters": "C - U - P", "emoji": "☕", "lottie": "https://assets6.lottiefiles.com/packages/lf20_kuhijlvx.json"},
    {"word": "BAT", "letters": "B - A - T", "emoji": "🏏", "lottie": "https://assets9.lottiefiles.com/packages/lf20_k86wxpgr.json"},
    {"word": "HEN", "letters": "H - E - N", "emoji": "🐔", "lottie": "https://assets8.lottiefiles.com/packages/lf20_5tl1xxnz.json"},
    {"word": "PIG", "letters": "P - I - G", "emoji": "🐷", "lottie": "https://assets10.lottiefiles.com/packages/lf20_s9614m.json"},
    {"word": "ANT", "letters": "A - N - T", "emoji": "🐜", "lottie": "https://assets2.lottiefiles.com/packages/lf20_touohxv0.json"},
    {"word": "COW", "letters": "C - O - W", "emoji": "🐄", "lottie": "https://assets5.lottiefiles.com/packages/lf20_2cwDXD.json"},
  ];

  static const List> sightWordSentences = [
    {"word": "I", "sentence": "I am a good boy.", "emoji": "👦", "lottie": "https://assets2.lottiefiles.com/packages/lf20_u4yrau.json"},
    {"word": "AM", "sentence": "I am happy today.", "emoji": "😊", "lottie": "https://assets6.lottiefiles.com/packages/lf20_xlky4kvh.json"},
    {"word": "IS", "sentence": "It is a big Lion.", "emoji": "🦁", "lottie": "https://assets1.lottiefiles.com/packages/lf20_lc46h4dr.json"},
    {"word": "MY", "sentence": "This is my Ball.", "emoji": "⚽", "lottie": "https://assets9.lottiefiles.com/packages/lf20_k86wxpgr.json"},
    {"word": "THIS", "sentence": "This is a red Apple.", "emoji": "🍎", "lottie": "https://assets2.lottiefiles.com/packages/lf20_touohxv0.json"},
    {"word": "THAT", "sentence": "That is a flying Kite.", "emoji": "🪁", "lottie": "https://assets7.lottiefiles.com/packages/lf20_tll0j4bb.json"},
  ];
}

class SmartLottieBox extends StatelessWidget {
  final String url;
  final String fallbackEmoji;
  final double size;

  const SmartLottieBox({
    super.key,
    required this.url,
    required this.fallbackEmoji,
    this.size = 110,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Lottie.network(
        url,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Text(
              fallbackEmoji,
              style: TextStyle(fontSize: size * 0.72),
            ),
          );
        },
      ),
    );
  }
}

class LkgSyllabusHomeScreen extends StatelessWidget {
  const LkgSyllabusHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width > 650;

    final List> chapters = [
      {
        "ch": "Chapter 1",
        "title": "Capital A - Z",
        "sub": "Aao Ab A-Z Seekhte Hain",
        "color": const Color(0xFFFFD54F),
        "emoji": "🍎",
        "page": const Chapter1AlphabetScreen(),
      },
      {
        "ch": "Chapter 2",
        "title": "Small a - z Tracing",
        "sub": "Ungli Se Likhna Seekho",
        "color": const Color(0xFF81C784),
        "emoji": "✍️",
        "page": const Chapter2TracingScreen(),
      },
      {
        "ch": "Chapter 3",
        "title": "Phonics Sounds",
        "sub": "Awaaz Suno Aur Pehechano",
        "color": const Color(0xFF64B5F6),
        "emoji": "🔊",
        "page": const Chapter3PhonicsScreen(),
      },
      {
        "ch": "Chapter 4",
        "title": "3-Letter Words",
        "sub": "Cat, Dog, Sun Padhna Seekho",
        "color": const Color(0xFFFFB74D),
        "emoji": "🐱",
        "page": const Chapter4ThreeLetterScreen(),
      },
      {
        "ch": "Chapter 5",
        "title": "Sight Words",
        "sub": "Chhote Sentence Banao",
        "color": const Color(0xFFBA68C8),
        "emoji": "📖",
        "page": const Chapter5SightWordsScreen(),
      },
      {
        "ch": "Chapter 6",
        "title": "Fun Test & Games",
        "sub": "3 Khel Khelo Aur Star Jeeto",
        "color": const Color(0xFFE57373),
        "emoji": "🏆",
        "page": const Chapter6TestHubScreen(),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "Pari Kids • ICSE LKG App",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF0D47A1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Namaste Beta! Aao Seekhte Hain",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 28 : 21,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF0D47A1),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                    onPressed: () {
                      VoiceHelper.speak("Chalo L K G Maths me chalte hain");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LkgMathsScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF43A047),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                    ),
                    icon: const Icon(Icons.calculate_rounded),
                    label: Text(
                      "LKG Maths Section Kholo (1-20 & Games)",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: isTablet ? 2 : 1,
                        childAspectRatio: isTablet ? 2.5 : 3.1,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 14,
                      ),
                      itemCount: chapters.length,
                      itemBuilder: (context, index) {
                        final item = chapters[index];
                        return InkWell(
                          onTap: () {
                            VoiceHelper.speak("Aao ${item['title']} seekhte hain");
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => item["page"]),
                            );
                          },
                          borderRadius: BorderRadius.circular(24),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            decoration: BoxDecoration(
                              color: item["color"],
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.12),
                                  blurRadius: 6,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        item["ch"],
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        item["title"],
                                        style: GoogleFonts.poppins(
                                          fontSize: isTablet ? 22 : 20,
                                          fontWeight: FontWeight.w800,
                                          color: const Color(0xFF0D47A1),
                                        ),
                                      ),
                                      Text(
                                        item["sub"],
                                        style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  item["emoji"],
                                  style: const TextStyle(fontSize: 48),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Chapter1AlphabetScreen extends StatefulWidget {
  const Chapter1AlphabetScreen({super.key});

  @override
  State<Chapter1AlphabetScreen> createState() => _Chapter1AlphabetScreenState();
}

class _Chapter1AlphabetScreenState extends State<Chapter1AlphabetScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _announceLetter(0);
  }

  void _announceLetter(int index) {
    final item = LkgData.alphabet[index];
    VoiceHelper.speak("${item['cap']} for ${item['word']}");
  }

  @override
  Widget build(BuildContext context) {
    final current = LkgData.alphabet[_selectedIndex];
    final bool isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD54F),
        title: Text("Chapter 1: Capital A - Z", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.orange, width: 3),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(
                      current["cap"]!,
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 80 : 64,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xFF0D47A1),
                      ),
                    ),
                    Text(
                      "${current['cap']} for ${current['word']}",
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 24 : 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
                SmartLottieBox(
                  url: current["lottie"]!,
                  fallbackEmoji: current["emoji"]!,
                  size: isTablet ? 150 : 120,
                ),
              ],
            ),
          ),
          Text(
            "Kisi Bhi Letter Ko Dabao Beta!",
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16, color: const Color(0xFF0D47A1)),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(14),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isTablet ? 6 : 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: LkgData.alphabet.length,
              itemBuilder: (context, index) {
                final item = LkgData.alphabet[index];
                final isSelected = index == _selectedIndex;
                return ElevatedButton(
                  onPressed: () {
                    setState(() => _selectedIndex = index);
                    _announceLetter(index);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? const Color(0xFF0D47A1) : Colors.white,
                    foregroundColor: isSelected ? Colors.white : const Color(0xFF0D47A1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    item["cap"]!,
                    style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w800),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Chapter2TracingScreen extends StatefulWidget {
  const Chapter2TracingScreen({super.key});

  @override
  State<Chapter2TracingScreen> createState() => _Chapter2TracingScreenState();
}

class _Chapter2TracingScreenState extends State<Chapter2TracingScreen> {
  int _index = 0;
  List<Offset?> _points = [];
  bool _completed = false;

  void _onDraw(Offset point) {
    setState(() {
      _points.add(point);
      if (_points.length > 25 && !_completed) {
        _completed = true;
        final item = LkgData.alphabet[_index];
        VoiceHelper.speak("Shabash! Bahut Achha! ${item['small']} for ${item['word']}");
      }
    });
  }

  void _nextLetter() {
    setState(() {
      _index = (_index + 1) % LkgData.alphabet.length;
      _points.clear();
      _completed = false;
    });
    VoiceHelper.speak("Aao ab small ${LkgData.alphabet[_index]['small']} likhte hain");
  }

  @override
  Widget build(BuildContext context) {
    final item = LkgData.alphabet[_index];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF81C784),
        title: Text("Chapter 2: Small a - z Tracing", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Ungli Se '${item['small']}' Par Likho Beta!",
              style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF0D47A1)),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.green, width: 3),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      item["small"]!,
                      style: GoogleFonts.poppins(
                        fontSize: 210,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    GestureDetector(
                      onPanUpdate: (details) => _onDraw(details.localPosition),
                      onPanEnd: (_) => _points.add(null),
                      child: CustomPaint(
                        painter: _TracingPainter(_points),
                        size: Size.infinite,
                      ),
                    ),
                    if (_completed)
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Column(
                          children: [
                            SmartLottieBox(url: item["lottie"]!, fallbackEmoji: item["emoji"]!, size: 90),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(12)),
                              child: Text("Shabash!", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => setState(() {
                    _points.clear();
                    _completed = false;
                  }),
                  icon: const Icon(Icons.refresh),
                  label: Text("Phir Se Likho", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                ),
                ElevatedButton.icon(
                  onPressed: _nextLetter,
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0D47A1), foregroundColor: Colors.white),
                  icon: const Icon(Icons.arrow_forward),
                  label: Text("Agla Letter", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TracingPainter extends CustomPainter {
  final List<Offset?> points;
  _TracingPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepOrange
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 14.0;

    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_TracingPainter oldDelegate) => true;
}

class Chapter3PhonicsScreen extends StatefulWidget {
  const Chapter3PhonicsScreen({super.key});

  @override
  State<Chapter3PhonicsScreen> createState() => _Chapter3PhonicsScreenState();
}

class _Chapter3PhonicsScreenState extends State<Chapter3PhonicsScreen> {
  int _targetIndex = 0;
  List<int> _options = [0, 1, 2];

  @override
  void initState() {
    super.initState();
    _generateRound();
  }

  void _generateRound() {
    final rand = Random();
    _targetIndex = rand.nextInt(LkgData.alphabet.length);
    Set<int> opts = {_targetIndex};
    while (opts.length < 3) {
      opts.add(rand.nextInt(LkgData.alphabet.length));
    }
    _options = opts.toList()..shuffle();
    _playTargetSound();
  }

  void _playTargetSound() {
    final item = LkgData.alphabet[_targetIndex];
    VoiceHelper.speak("${item['cap']} says ${item['phonics']}, ${item['word']}");
  }

  void _checkChoice(int chosenIndex) {
    if (chosenIndex == _targetIndex) {
      VoiceHelper.speak("Shabash! Bahut Achha!");
      setState(() => _generateRound());
    } else {
      VoiceHelper.speak("Koi Baat Nahi, Phir Se Try Karo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF64B5F6),
          title: Text("Chapter 3: Phonics", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          bottom: TabBar(
            labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            tabs: const [
              Tab(text: "Phonics Sounds"),
              Tab(text: "Awaaz Suno Game"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              padding: const EdgeInsets.all(14),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: LkgData.alphabet.length,
              itemBuilder: (context, index) {
                final item = LkgData.alphabet[index];
                return InkWell(
                  onTap: () => VoiceHelper.speak("${item['cap']} says ${item['phonics']}, ${item['word']}"),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${item['cap']} / ${item['small']}", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold)),
                        Text("\"${item['phonics']}\"", style: GoogleFonts.poppins(fontSize: 16, color: Colors.deepOrange, fontWeight: FontWeight.w600)),
                        const Icon(Icons.volume_up, color: Colors.blue),
                      ],
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Awaaz Suno Aur Sahi Picture Dabao!", textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: _playTargetSound,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                    icon: const Icon(Icons.volume_up, size: 30),
                    label: Text("Awaaz Suno", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _options.map((idx) {
                      final opt = LkgData.alphabet[idx];
                      return InkWell(
                        onTap: () => _checkChoice(idx),
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(color: Colors.blue, width: 2),
                          ),
                          child: Column(
                            children: [
                              SmartLottieBox(url: opt["lottie"]!, fallbackEmoji: opt["emoji"]!, size: 80),
                              Text(opt["word"]!, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Chapter4ThreeLetterScreen extends StatelessWidget {
  const Chapter4ThreeLetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFB74D),
        title: Text("Chapter 4: 3-Letter Words", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isTablet ? 3 : 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.9,
        ),
        itemCount: LkgData.threeLetterWords.length,
        itemBuilder: (context, index) {
          final item = LkgData.threeLetterWords[index];
          return InkWell(
            onTap: () => VoiceHelper.speak("${item['letters']} ... ${item['word']}"),
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SmartLottieBox(url: item["lottie"]!, fallbackEmoji: item["emoji"]!, size: 95),
                  const SizedBox(height: 8),
                  Text(item["letters"]!, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey.shade700)),
                  Text(item["word"]!, style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w900, color: const Color(0xFF0D47A1))),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Chapter5SightWordsScreen extends StatelessWidget {
  const Chapter5SightWordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFBA68C8),
        foregroundColor: Colors.white,
        title: Text("Chapter 5: Sight Words", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: LkgData.sightWordSentences.length,
        itemBuilder: (context, index) {
          final item = LkgData.sightWordSentences[index];
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.only(bottom: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
            child: InkWell(
              onTap: () => VoiceHelper.speak("${item['word']} ... ${item['sentence']}"),
              borderRadius: BorderRadius.circular(22),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.purple.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        item["word"]!,
                        style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w900, color: Colors.purple.shade900),
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        item["sentence"]!,
                        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: const Color(0xFF0D47A1)),
                      ),
                    ),
                    SmartLottieBox(url: item["lottie"]!, fallbackEmoji: item["emoji"]!, size: 70),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class Chapter6TestHubScreen extends StatelessWidget {
  const Chapter6TestHubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFE57373),
          foregroundColor: Colors.white,
          title: Text("Chapter 6: Test Games", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12),
            tabs: const [
              Tab(text: "1. Missing Letter"),
              Tab(text: "2. Jodi Milao"),
              Tab(text: "3. Sahi Picture"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _MissingLetterGame(),
            _MatchPairsGame(),
            _ChoosePictureGame(),
          ],
        ),
      ),
    );
  }
}

void _showStarCelebration(BuildContext context, VoidCallback onNext) {
  VoiceHelper.speak("Shabash! Bahut Achha!");
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SmartLottieBox(
            url: "https://assets2.lottiefiles.com/packages/lf20_touohxv0.json",
            fallbackEmoji: "⭐",
            size: 120,
          ),
          Text("Shabash! Bahut Achha!", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green)),
          const SizedBox(height: 14),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              onNext();
            },
            child: Text("Aage Badho", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    ),
  );
}

class _MissingLetterGame extends StatefulWidget {
  const _MissingLetterGame();

  @override
  State<_MissingLetterGame> createState() => _MissingLetterGameState();
}

class _MissingLetterGameState extends State<_MissingLetterGame> {
  int _wordIdx = 0;

  @override
  Widget build(BuildContext context) {
    final item = LkgData.threeLetterWords[_wordIdx];
    final word = item["word"]!;
    final missingChar = word[1];
    final options = [missingChar, "O", "E"].toSet().toList()..shuffle();
    if (options.length < 3) options.add("U");

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Khali Jagah Bharo Beta!", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          SmartLottieBox(url: item["lottie"]!, fallbackEmoji: item["emoji"]!, size: 120),
          const SizedBox(height: 16),
          Text("${word[0]}  _  ${word[2]}", style: GoogleFonts.poppins(fontSize: 44, fontWeight: FontWeight.w900, color: const Color(0xFF0D47A1))),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: options.map((ch) {
              return ElevatedButton(
                onPressed: () {
                  if (ch == missingChar) {
                    _showStarCelebration(context, () {
                      setState(() => _wordIdx = (_wordIdx + 1) % LkgData.threeLetterWords.length);
                    });
                  } else {
                    VoiceHelper.speak("Koi Baat Nahi, Phir Se Try Karo");
                  }
                },
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16)),
                child: Text(ch, style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.bold)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _MatchPairsGame extends StatefulWidget {
  const _MatchPairsGame();

  @override
  State<_MatchPairsGame> createState() => _MatchPairsGameState();
}

class _MatchPairsGameState extends State<_MatchPairsGame> {
  String? _selectedLetter;
  final List<int> _indices = [0, 1, 2, 3];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text("Pehle Letter Dabao, Phir Sahi Picture!", style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _indices.map((i) {
                    final cap = LkgData.alphabet[i]["cap"]!;
                    return ElevatedButton(
                      onPressed: () {
                        setState(() => _selectedLetter = cap);
                        VoiceHelper.speak(cap);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedLetter == cap ? Colors.orange : Colors.white,
                        padding: const EdgeInsets.all(20),
                      ),
                      child: Text(cap, style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.bold)),
                    );
                  }).toList(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _indices.reversed.map((i) {
                    final item = LkgData.alphabet[i];
                    return InkWell(
                      onTap: () {
                        if (_selectedLetter == item["cap"]) {
                          _showStarCelebration(context, () => setState(() => _selectedLetter = null));
                        } else {
                          VoiceHelper.speak("Koi Baat Nahi, Phir Se Try Karo");
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                        child: Text(item["emoji"]!, style: const TextStyle(fontSize: 40)),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChoosePictureGame extends StatefulWidget {
  const _ChoosePictureGame();

  @override
  State<_ChoosePictureGame> createState() => _ChoosePictureGameState();
}

class _ChoosePictureGameState extends State<_ChoosePictureGame> {
  int _qIndex = 0;

  @override
  Widget build(BuildContext context) {
    final target = LkgData.alphabet[_qIndex];
    final choices = [
      target,
      LkgData.alphabet[(_qIndex + 3) % 26],
      LkgData.alphabet[(_qIndex + 7) % 26],
    ]..shuffle();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Isme Se '${target['word']}' Kaun Sa Hai?", style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold, color: const Color(0xFF0D47A1))),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: choices.map((c) {
              return InkWell(
                onTap: () {
                  if (c["word"] == target["word"]) {
                    _showStarCelebration(context, () {
                      setState(() => _qIndex = (_qIndex + 1) % LkgData.alphabet.length);
                    });
                  } else {
                    VoiceHelper.speak("Koi Baat Nahi, Phir Se Try Karo");
                  }
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(color: Colors.redAccent, width: 2),
                  ),
                  child: SmartLottieBox(url: c["lottie"]!, fallbackEmoji: c["emoji"]!, size: 85),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}                    
