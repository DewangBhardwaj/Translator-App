import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GoogleTranslator translator = GoogleTranslator();
  String out = ""; // Initialized with an empty string
  String selectedLanguage = 'English';
  String _translateLanguage = '';

  final List<String> listLanguage = [
    "Afrikaans",
    "Albanian",
    "Amharic",
    "Arabic",
    "Armenian",
    "Azerbaijani",
    "Basque",
    "Belarusian",
    "Bengali",
    "Bosnian",
    "Bulgarian",
    "Catalan",
    "Cebuano",
    "Chichewa",
    "Chinese Simplified",
    "Chinese Traditional",
    "Corsican",
    "Croatian",
    "Czech",
    "Danish",
    "Dutch",
    "English",
    "Esperanto",
    "Estonian",
    "Filipino",
    "Finnish",
    "French",
    "Frisian",
    "Galician",
    "Georgian",
    "German",
    "Greek",
    "Gujarati",
    "Haitian Creole",
    "Hausa",
    "Hawaiian",
    "Hebrew",
    "Hindi",
    "Hmong",
    "Hungarian",
    "Icelandic",
    "Igbo",
    "Indonesian",
    "Irish",
    "Italian",
    "Japanese",
    "Javanese",
    "Kannada",
    "Kazakh",
    "Khmer",
    "Korean",
    "Kurdish (Kurmanji)",
    "Kyrgyz",
    "Lao",
    "Latin",
    "Latvian",
    "Lithuanian",
    "Luxembourgish",
    "Macedonian",
    "Malagasy",
    "Malay",
    "Malayalam",
    "Maltese",
    "Maori",
    "Marathi",
    "Mongolian",
    "Myanmar (Burmese)",
    "Nepali",
    "Norwegian",
    "Pashto",
    "Persian",
    "Polish",
    "Portuguese",
    "Punjabi",
    "Romanian",
    "Russian",
    "Samoan",
    "Scots Gaelic",
    "Serbian",
    "Sesotho",
    "Shona",
    "Sindhi",
    "Sinhala",
    "Slovak",
    "Slovenian",
    "Somali",
    "Spanish",
    "Sundanese",
    "Swahili",
    "Swedish",
    "Tajik",
    "Tamil",
    "Telugu",
    "Thai",
    "Turkish",
    "Ukrainian",
    "Urdu",
    "Uzbek",
    "Vietnamese",
    "Welsh",
    "Xhosa",
    "Yiddish",
    "Yoruba",
    "Zulu",
  ];

  final TextEditingController langController = TextEditingController();

  final Map<String, String> languageCodes = {
    "Afrikaans": 'af',
    "Albanian": 'sq',
    "Amharic": 'am',
    "Arabic": 'ar',
    "Armenian": 'hy',
    "Azerbaijani": 'az',
    "Basque": 'eu',
    "Belarusian": 'be',
    "Bengali": 'bn',
    "Bosnian": 'bs',
    "Bulgarian": 'bg',
    "Catalan": 'ca',
    "Cebuano": 'ceb',
    "Chichewa": 'ny',
    "Chinese Simplified": 'zh-cn',
    "Chinese Traditional": 'zh-tw',
    "Corsican": 'co',
    "Croatian": 'hr',
    "Czech": 'cs',
    "Danish": 'da',
    "Dutch": 'nl',
    "English": 'en',
    "Esperanto": 'et',
    "Estonian": 'et',
    "Filipino": 'tl',
    "Finnish": 'fi',
    "French": 'fr',
    "Frisian": 'fy',
    "Galician": 'gl',
    "Georgian": 'ka',
    "German": 'de',
    "Greek": 'el',
    "Gujarati": 'gu',
    "Haitian Creole": 'ht',
    "Hausa": 'ha',
    "Hawaiian": 'haw',
    "Hebrew": 'iw',
    "Hindi": 'hi',
    "Hmong": 'hmn',
    "Hungarian": 'hu',
    "Icelandic": 'is',
    "Igbo": 'ig',
    "Indonesian": 'id',
    "Irish": 'ga',
    "Italian": 'it',
    "Japanese": 'ja',
    "Javanese": 'jw',
    "Kannada": 'kn',
    "Kazakh": 'kk',
    "Khmer": 'km',
    "Korean": 'ko',
    "Kurdish (Kurmanji)": 'ku',
    "Kyrgyz": 'ky',
    "Lao": 'lo',
    "Latin": 'la',
    "Latvian": 'lv',
    "Lithuanian": 'lt',
    "Luxembourgish": 'lb',
    "Macedonian": 'mk',
    "Malagasy": 'mg',
    "Malay": 'ms',
    "Malayalam": 'ml',
    "Maltese": 'mt',
    "Maori": 'mi',
    "Marathi": 'mr',
    "Mongolian": 'mn',
    "Myanmar (Burmese)": 'my',
    "Nepali": 'ne',
    "Norwegian": 'no',
    "Pashto": 'ps',
    "Persian": 'fa',
    "Polish": 'pl',
    "Portuguese": 'pt',
    "Punjabi": 'pa',
    "Romanian": 'ro',
    "Russian": 'ru',
    "Samoan": 'sm',
    "Scots Gaelic": 'gd',
    "Serbian": 'sr',
    "Sesotho": 'st',
    "Shona": 'sn',
    "Sindhi": 'sd',
    "Sinhala": 'si',
    "Slovak": 'sk',
    "Slovenian": 'sl',
    "Somali": 'so',
    "Spanish": 'es',
    "Sundanese": 'su',
    "Swahili": 'sw',
    "Swedish": 'sv',
    "Tajik": 'tg',
    "Tamil": 'ta',
    "Telugu": 'te',
    "Thai": 'th',
    "Turkish": 'tr',
    "Ukrainian": 'uk',
    "Urdu": 'ur',
    "Uzbek": 'uz',
    "Vietnamese": 'vi',
    "Welsh": 'cy',
    "Xhosa": 'xh',
    "Yiddish": 'yi',
    "Yoruba": 'yo',
    "Zulu": 'zu',
  };

  void trans() {
    // Get the language code from the map
    _translateLanguage = languageCodes[selectedLanguage] ?? 'en';

    translator.translate(langController.text, to: _translateLanguage).then((value) {
      setState(() {
        out = value.text; // Store the translated text
      });
    }).catchError((error) {
      setState(() {
        out = 'Error: $error'; // Handle error
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                  text: 'Flutter',
                  style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF121212),
                      fontFamily: 'PoppinsBold')),
              TextSpan(
                  text: ' Translate',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontFamily: 'PoppinsBold')),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF121212),
                  ),
                  child: Center(
                    child: TextField(
                      controller: langController,
                      minLines: 5,
                      maxLines: 999,
                      decoration: InputDecoration(
                        hintText: "Tap to enter text",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontFamily: 'PoppinsReg',
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: TextStyle(
                          fontFamily: 'PoppinsReg',
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.only(right: 198.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: listLanguage.map<DropdownMenuItem<String>>((value) {
                      return DropdownMenuItem<String>(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    value: selectedLanguage,
                    style: TextStyle(
                        fontFamily: 'PoppinsReg', color: Colors.black),
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value!;
                      });
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.blue[400],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 15.0, left: 10.0, right: 10.0),
                    child: SelectableText(
                      out,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'PoppinsReg',
                      ),
                      showCursor: true,
                      cursorColor: Colors.white,
                      minLines: 5,
                      maxLines: 999,
                      scrollPhysics: ClampingScrollPhysics(),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.red[400],
                    ),
                    child: TextButton(
                      onPressed: trans,
                      child: Text("Translate",
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'PoppinsBold')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
