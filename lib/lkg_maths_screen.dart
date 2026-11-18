import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';

class LkgMathsScreen extends StatelessWidget {
  const LkgMathsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width > 650;

    final List> chapters = [
      {
        "ch": "Chapter 1",
        "title": "Numbers 1 - 20",
        "sub": "Aao 1 Se 20 Tak Ginti Seekhein",
        "color": const Color(0xFFFFD54F),
        "emoji": "🔢",
        "page": const MathsChapter1NumbersScreen(),
      },
      {
        "ch": "Chapter 2",
        "title": "Number Tracing 1 - 10",
        "sub": "Ungli Se Number Likhna Seekho",
        "color": const Color(0xFF81C784),
        "emoji": "✍️",
        "page": const MathsChapter2TracingScreen(),
      },
      {
        "ch": "Chapter 3",
        "title": "Count & Tap Game",
        "sub": "Pictures Gino Aur Sahi Number Dabao",
        "color": const Color(0xFF64B5F6),
        "emoji": "🍎",
        "page": const MathsChapter3CountingGame(),
      },
      {
        "ch": "Chapter 4",
        "title": "Shapes (Aakaar)",
        "sub": "Circle, Square, Triangle Seekho",
        "color": const Color(0xFFFFB74D),
        "emoji": "🔺",
        "page": const MathsChapter4ShapesScreen(),
      },
      {
        "ch": "Chapter 5",
        "title": "Big & Small Concepts",
        "sub": "Bada-Chhota, Lamba-Chhota Seekho",
        "color": const Color(0xFFBA68C8),
        "emoji": "🐘",
        "page": const MathsChapter5ConceptsScreen(),
      },
      {
        "ch": "Chapter 6",
        "title": "Maths Fun Test",
        "sub": "3 Khel Khelo Aur Star Jeeto",
        "color": const Color(0xFFE57373),
        "emoji": "🏆",
        "page": const MathsChapter6TestHub(),
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF81C784),
        title: Text(
          "Pari Kids • LKG Maths",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, color: const Color(0xFF0D47A1)),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    "Namaste Beta! Aao Maths Seekhte Hain",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: isTablet ? 28 : 21,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF0D47A1),
                    ),
                  ),
                  const SizedBox(height: 14),
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
                            MathsVoice.speak("Aao ${item['title']} seekhte hain");
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
                                        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        item["title"],
                                        style: GoogleFonts.poppins(
                                          fontSize: isTablet ? 22 : 19,
                                          fontWeight: FontWeight.w800,
                                          color: const Color(0xFF0D47A1),
                                        ),
                                      ),
                                      Text(
                                        item["sub"],
                                        style: GoogleFonts.poppins(fontSize: 13, fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(item["emoji"], style: const TextStyle(fontSize: 46)),
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

class MathsVoice {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> speak(String text) async {
    await _tts.stop();
    await _tts.setLanguage("en-IN");
    await _tts.setPitch(1.25);
    await _tts.setSpeechRate(0.42);
    await _tts.speak(text);
  }
}

class MathsData {
  static const List> numbers = [
    {"num": 1, "word": "One", "emoji": "🍎"},
    {"num": 2, "word": "Two", "emoji": "⚽"},
    {"num": 3, "word": "Three", "emoji": "🐱"},
    {"num": 4, "word": "Four", "emoji": "🚗"},
    {"num": 5, "word": "Five", "emoji": "⭐"},
    {"num": 6, "word": "Six", "emoji": "🍌"},
    {"num": 7, "word": "Seven", "emoji": "🎈"},
    {"num": 8, "word": "Eight", "emoji": "🦋"},
    {"num": 9, "word": "Nine", "emoji": "🍓"},
    {"num": 10, "word": "Ten", "emoji": "🌼"},
    {"num": 11, "word": "Eleven", "emoji": "🐟"},
    {"num": 12, "word": "Twelve", "emoji": "🍩"},
    {"num": 13, "word": "Thirteen", "emoji": "🚀"},
    {"num": 14, "word": "Fourteen", "emoji": "🍦"},
    {"num": 15, "word": "Fifteen", "emoji": "🐢"},
    {"num": 16, "word": "Sixteen", "emoji": "🍇"},
    {"num": 17, "word": "Seventeen", "emoji": "🐥"},
    {"num": 18, "word": "Eighteen", "emoji": "🍪"},
    {"num": 19, "word": "Nineteen", "emoji": "🪁"},
    {"num": 20, "word": "Twenty", "emoji": "🎁"},
  ];

  static const List> shapes = [
    {"name": "Circle", "hinglish": "Gol (Circle)", "example": "Sun aur Ball Circle hote hain", "emoji": "🟠"},
    {"name": "Square", "hinglish": "Chaukor (Square)", "example": "Gift Box aur Window Square hote hain", "emoji": "🟦"},
    {"name": "Triangle", "hinglish": "Tikona (Triangle)", "example": "Pizza Slice aur Mountain Triangle hote hain", "emoji": "🔺"},
    {"name": "Rectangle", "hinglish": "Lamba Box (Rectangle)", "example": "Mobile aur Book Rectangle hote hain", "emoji": "🟩"},
    {"name": "Star", "hinglish": "Taara (Star)", "example": "Aasman me chamakta Star", "emoji": "⭐"},
    {"name": "Heart", "hinglish": "Dil (Heart)", "example": "Pyara sa Red Heart", "emoji": "❤️"},
  ];

  static const List> concepts = [
    {
      "title": "Big & Small (Bada - Chhota)",
      "q": "Isme se BIG (Bada) kaun sa hai?",
      "leftLabel": "Big Elephant",
      "leftEmoji": "🐘",
      "leftSize": 75.0,
      "rightLabel": "Small Mouse",
      "rightEmoji": "🐭",
      "rightSize": 38.0,
      "correct": "left",
    },
    {
      "title": "Tall & Short (Lamba - Chhota)",
      "q": "Isme se TALL (Lamba) kaun sa hai?",
      "leftLabel": "Tall Giraffe",
      "leftEmoji": "🦒",
      "leftSize": 78.0,
      "rightLabel": "Short Rabbit",
      "rightEmoji": "🐇",
      "rightSize": 40.0,
      "correct": "left",
    },
    {
      "title": "More & Less (Zyada - Kam)",
      "q": "Kis box me MORE (Zyada) Apples hain?",
      "leftLabel": "1 Apple (Less)",
      "leftEmoji": "🍎",
      "leftSize": 45.0,
      "rightLabel": "4 Apples (More)",
      "rightEmoji": "🍎🍎🍎🍎",
      "rightSize": 34.0,
      "correct": "right",
    },
    {
      "title": "Heavy & Light (Bhari - Halka)",
      "q": "Isme se LIGHT (Halka) kaun sa hai?",
      "leftLabel": "Heavy Car",
      "leftEmoji": "🚗",
      "leftSize": 68.0,
      "rightLabel": "Light Feather",
      "rightEmoji": "🪶",
      "rightSize": 45.0,
      "correct": "right",
    },
  ];
}

class MathsChapter1NumbersScreen extends StatefulWidget {
  const MathsChapter1NumbersScreen({super.key});

  @override
  State<MathsChapter1NumbersScreen> createState() => _MathsChapter1NumbersScreenState();
}

class _MathsChapter1NumbersScreenState extends State<MathsChapter1NumbersScreen> {
  int _selectedIdx = 0;

  @override
  void initState() {
    super.initState();
    _speakNum(0);
  }

  void _speakNum(int idx) {
    final item = MathsData.numbers[idx];
    MathsVoice.speak("${item['num']} ...${item['word']}");
  }

  @override
  Widget build(BuildContext context) {
    final item = MathsData.numbers[_selectedIdx];
    final int count = item["num"];
    final bool isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFD54F),
        title: Text("Chapter 1: Numbers 1 - 20", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(14),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(color: Colors.orange, width: 3),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$count",
                      style: GoogleFonts.poppins(fontSize: 58, fontWeight: FontWeight.w900, color: const Color(0xFF0D47A1)),
                    ),
                    const SizedBox(width: 18),
                    Text(
                      item["word"],
                      style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepOrange),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 6,
                  runSpacing: 4,
                  children: List.generate(
                    count,
                    (_) => Text(item["emoji"], style: TextStyle(fontSize: count > 10 ? 22 : 28)),
                  ),
                ),
              ],
            ),
          ),
          Text("Kisi Bhi Number Ko Dabao Beta!", style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15)),
          const SizedBox(height: 6),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(14),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isTablet ? 5 : 4,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: MathsData.numbers.length,
              itemBuilder: (context, index) {
                final numVal = MathsData.numbers[index]["num"];
                final isSelected = index == _selectedIdx;
                return ElevatedButton(
                  onPressed: () {
                    setState(() => _selectedIdx = index);
                    _speakNum(index);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected ? const Color(0xFF0D47A1) : Colors.white,
                    foregroundColor: isSelected ? Colors.white : const Color(0xFF0D47A1),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                    padding: EdgeInsets.zero,
                  ),
                  child: Text("$numVal", style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.w800)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MathsChapter2TracingScreen extends StatefulWidget {
  const MathsChapter2TracingScreen({super.key});

  @override
  State<MathsChapter2TracingScreen> createState() => _MathsChapter2TracingScreenState();
}

class _MathsChapter2TracingScreenState extends State<MathsChapter2TracingScreen> {
  int _numIdx = 0;
  List<Offset?> _points = [];
  bool _done = false;

  void _onDraw(Offset p) {
    setState(() {
      _points.add(p);
      if (_points.length > 22 && !_done) {
        _done = true;
        final item = MathsData.numbers[_numIdx];
        MathsVoice.speak("Shabash! Bahut Achha! Number ${item['num']}${item['word']}");
      }
    });
  }

  void _nextNumber() {
    setState(() {
      _numIdx = (_numIdx + 1) % 10;
      _points.clear();
      _done = false;
    });
    MathsVoice.speak("Aao ab number ${MathsData.numbers[_numIdx]['num']} likhte hain");
  }

  @override
  Widget build(BuildContext context) {
    final item = MathsData.numbers[_numIdx];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF81C784),
        title: Text("Chapter 2: Number Tracing", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              "Ungli Se Number '${item['num']}' Par Likho Beta!",
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
                      "${item['num']}",
                      style: GoogleFonts.poppins(fontSize: 210, fontWeight: FontWeight.bold, color: Colors.grey.shade300),
                    ),
                    GestureDetector(
                      onPanUpdate: (d) => _onDraw(d.localPosition),
                      onPanEnd: (_) => _points.add(null),
                      child: CustomPaint(painter: _MathsTracePainter(_points), size: Size.infinite),
                    ),
                    if (_done)
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(18)),
                          child: Column(
                            children: [
                              Text(item["emoji"], style: const TextStyle(fontSize: 42)),
                              Text("Shabash!", style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold)),
                            ],
                          ),
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
                    _done = false;
                  }),
                  icon: const Icon(Icons.refresh),
                  label: Text("Phir Se Likho", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                ),
                ElevatedButton.icon(
                  onPressed: _nextNumber,
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0D47A1), foregroundColor: Colors.white),
                  icon: const Icon(Icons.arrow_forward),
                  label: Text("Agla Number", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MathsTracePainter extends CustomPainter {
  final List<Offset?> points;
  _MathsTracePainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 14.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i]!, points[i + 1]!, paint);
      }
    }
  }

  @override
  bool shouldRepaint(_MathsTracePainter old) => true;
}

class MathsChapter3CountingGame extends StatefulWidget {
  const MathsChapter3CountingGame({super.key});

  @override
  State<MathsChapter3CountingGame> createState() => _MathsChapter3CountingGameState();
}

class _MathsChapter3CountingGameState extends State<MathsChapter3CountingGame> {
  int _targetCount = 3;
  String _emoji = "🍎";
  List<int> _options = [2, 3, 5];

  @override
  void initState() {
    super.initState();
    _newRound();
  }

  void _newRound() {
    final rand = Random();
    _targetCount = rand.nextInt(9) + 1;
    _emoji = MathsData.numbers[rand.nextInt(10)]["emoji"];
    Set<int> opts = {_targetCount};
    while (opts.length < 3) {
      opts.add(rand.nextInt(9) + 1);
    }
    _options = opts.toList()..shuffle();
    MathsVoice.speak("Gino aur batao kitne hain?");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      appBar: AppBar(
        backgroundColor: const Color(0xFF64B5F6),
        title: Text("Chapter 3: Count & Tap", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Pictures Gino Aur Sahi Number Dabao!", textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF0D47A1))),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(color: Colors.blue, width: 3),
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: List.generate(_targetCount, (_) => Text(_emoji, style: const TextStyle(fontSize: 48))),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _options.map((numOpt) {
                return ElevatedButton(
                  onPressed: () {
                    if (numOpt == _targetCount) {
                      MathsVoice.speak("Shabash! Bahut Achha! $_targetCount bilkul sahi hai!");
                      setState(() => _newRound());
                    } else {
                      MathsVoice.speak("Koi Baat Nahi, Phir Se Gino Aur Try Karo");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0D47A1),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                  child: Text("$numOpt", style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold)),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class MathsChapter4ShapesScreen extends StatelessWidget {
  const MathsChapter4ShapesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFB74D),
        title: Text("Chapter 4: Shapes (Aakaar)", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isTablet ? 3 : 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 0.9,
        ),
        itemCount: MathsData.shapes.length,
        itemBuilder: (context, index) {
          final item = MathsData.shapes[index];
          return InkWell(
            onTap: () => MathsVoice.speak("${item['name']} ...${item['example']}"),
            borderRadius: BorderRadius.circular(24),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.orange, width: 2),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item["emoji"], style: const TextStyle(fontSize: 58)),
                  const SizedBox(height: 8),
                  Text(item["hinglish"], textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w800, color: const Color(0xFF0D47A1))),
                  const SizedBox(height: 4),
                  Text(item["example"], textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 12, color: Colors.black87)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MathsChapter5ConceptsScreen extends StatefulWidget {
  const MathsChapter5ConceptsScreen({super.key});

  @override
  State<MathsChapter5ConceptsScreen> createState() => _MathsChapter5ConceptsScreenState();
}

class _MathsChapter5ConceptsScreenState extends State<MathsChapter5ConceptsScreen> {
  int _idx = 0;

  void _checkAnswer(String side) {
    final item = MathsData.concepts[_idx];
    if (side == item["correct"]) {
      MathsVoice.speak("Shabash! Bahut Achha!");
      setState(() => _idx = (_idx + 1) % MathsData.concepts.length);
    } else {
      MathsVoice.speak("Koi Baat Nahi, Phir Se Try Karo");
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = MathsData.concepts[_idx];

    return Scaffold(
      backgroundColor: const Color(0xFFFFF9C4),
      appBar: AppBar(
        backgroundColor: const Color(0xFFBA68C8),
        foregroundColor: Colors.white,
        title: Text("Chapter 5: Pre-Math Concepts", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(color: Colors.purple.shade100, borderRadius: BorderRadius.circular(16)),
              child: Text(item["title"], style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple.shade900)),
            ),
            const SizedBox(height: 16),
            Text(item["q"], textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.w800, color: const Color(0xFF0D47A1))),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () => _checkAnswer("left"),
                    child: Container(
                      height: 190,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.purple, width: 2)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(item["leftEmoji"], style: TextStyle(fontSize: item["leftSize"])),
                          const SizedBox(height: 10),
                          Text(item["leftLabel"], textAlign: TextAlign.center, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () => _checkAnswer("right"),
                    child: Container(
                      height: 190,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), border: Border.all(color: Colors.purple, width: 2)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(item["rightEmoji"], style: TextStyle(fontSize: item["rightSize"])),
                          const SizedBox(height: 10),
                          Text(item["rightLabel"], textAlign: TextAlign.center, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MathsChapter6TestHub extends StatelessWidget {
  const MathsChapter6TestHub({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFFFF9C4),
        appBar: AppBar(
          backgroundColor: const Color(0xFFE57373),
          foregroundColor: Colors.white,
          title: Text("Chapter 6: Maths Test", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
          bottom: TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            labelStyle: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 12),
            tabs: const [
              Tab(text: "1. Missing Number"),
              Tab(text: "2. Jodi Milao"),
              Tab(text: "3. Easy Addition"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _MissingNumberGame(),
            _NumberMatchGame(),
            _EasyAdditionGame(),
          ],
        ),
      ),
    );
  }
}

void _showMathsStarReward(BuildContext context, VoidCallback onNext) {
  MathsVoice.speak("Shabash! Bahut Achha!");
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (ctx) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("⭐", style: TextStyle(fontSize: 75)),
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

class _MissingNumberGame extends StatefulWidget {
  const _MissingNumberGame();

  @override
  State<_MissingNumberGame> createState() => _MissingNumberGameState();
}

class _MissingNumberGameState extends State<_MissingNumberGame> {
  int _start = 1;

  @override
  Widget build(BuildContext context) {
    final missing = _start + 1;
    final options = [missing, missing + 2, missing + 4]..shuffle();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Bich Ka Number Bharo Beta!", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          Text("$_start   ,   _   ,${_start + 2}", style: GoogleFonts.poppins(fontSize: 44, fontWeight: FontWeight.w900, color: const Color(0xFF0D47A1))),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: options.map((opt) {
              return ElevatedButton(
                onPressed: () {
                  if (opt == missing) {
                    _showMathsStarReward(context, () => setState(() => _start = (_start % 15) + 1));
                  } else {
                    MathsVoice.speak("Koi Baat Nahi, Phir Se Try Karo");
                  }
                },
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16)),
                child: Text("$opt", style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.bold)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _NumberMatchGame extends StatefulWidget {
  const _NumberMatchGame();

  @override
  State<_NumberMatchGame> createState() => _NumberMatchGameState();
}

class _NumberMatchGameState extends State<_NumberMatchGame> {
  int? _selectedNum;
  final List<int> _nums = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text("Pehle Number Dabao, Phir Utne Pictures!", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _nums.map((n) {
                    return ElevatedButton(
                      onPressed: () {
                        setState(() => _selectedNum = n);
                        MathsVoice.speak("$n");
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: _selectedNum == n ? Colors.orange : Colors.white,
                        padding: const EdgeInsets.all(20),
                      ),
                      child: Text("$n", style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.bold)),
                    );
                  }).toList(),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _nums.reversed.map((n) {
                    return InkWell(
                      onTap: () {
                        if (_selectedNum == n) {
                          _showMathsStarReward(context, () => setState(() => _selectedNum = null));
                        } else {
                          MathsVoice.speak("Koi Baat Nahi, Phir Se Try Karo");
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                        child: Text("⭐" * n, style: const TextStyle(fontSize: 24)),
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

class _EasyAdditionGame extends StatefulWidget {
  const _EasyAdditionGame();

  @override
  State<_EasyAdditionGame> createState() => _EasyAdditionGameState();
}

class _EasyAdditionGameState extends State<_EasyAdditionGame> {
  int _a = 2;
  int _b = 1;

  @override
  Widget build(BuildContext context) {
    final ans = _a + _b;
    final options = [ans, ans + 1, ans + 2]..shuffle();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Sabko Milakar Gino Beta!", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
            child: Column(
              children: [
                Text("${'🍎' * _a}   +   ${'🍎' * _b}", style: const TextStyle(fontSize: 34)),
                const SizedBox(height: 10),
                Text("$_a  +$_b  =  ?", style: GoogleFonts.poppins(fontSize: 34, fontWeight: FontWeight.w900, color: const Color(0xFF0D47A1))),
              ],
            ),
          ),
          const SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: options.map((opt) {
              return ElevatedButton(
                onPressed: () {
                  if (opt == ans) {
                    _showMathsStarReward(context, () {
                      setState(() {
                        _a = (_a % 4) + 1;
                        _b = (_b % 3) + 1;
                      });
                    });
                  } else {
                    MathsVoice.speak("Koi Baat Nahi, Phir Se Try Karo");
                  }
                },
                style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16)),
                child: Text("$opt", style: GoogleFonts.poppins(fontSize: 26, fontWeight: FontWeight.bold)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
