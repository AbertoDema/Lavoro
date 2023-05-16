import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:countries_world_map/countries_world_map.dart';
import 'package:countries_world_map/data/maps/world_map.dart';
import 'package:flutter/material.dart';

class SupportedCountriesMap extends StatefulWidget {
  const SupportedCountriesMap({Key? key}) : super(key: key);

  @override
  _SupportedCountriesMapState createState() => _SupportedCountriesMapState();
}

class _SupportedCountriesMapState extends State<SupportedCountriesMap> {
  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 1);
  final List<String> list_name = [
        "afghanistan",
        "albania",
        "algeria",
        "angola",
        "argentina",
        "armenia",
        "australia",
        "austria",
        "azerbaijan",
        "bangladesh",
        "belarus",
        "belgium",
        "bhutan",
        "bolivia",
        "bosnia and herzegovina",
        "botswana",
        "brazil",
        "bulgaria",
        "burundi",
        "cambodia",
        "cameroon",
        "canada",
        "central african republic",
        "chad",
        "chile",
        "china",
        "colombia",
        "congo",
        "costa rica",
        "cote d'ivoire",
        "croatia",
        "cyprus",
        "czechia",
        "denmark",
        "ecuador",
        "egypt",
        "el salvador",
        "equatorial guinea",
        "eritrea",
        "estonia",
        "ethiopia",
        "finland",
        "france",
        "georgia",
        "germany",
        "ghana",
        "greece",
        "greenland",
        "guatemala",
        "guinea",
        "hungary",
        "iceland",
        "india",
        "indonesia",
        "iran",
        "iraq",
        "ireland",
        "israel",
        "italy",
        "jamaica",
        "japan",
        "jordan",
        "kazakhstan",
        "kenya",
        "kiribati",
        "korea (north)",
        "korea (south)",
        "kuwait",
        "kyrgyzstan",
        "lao people's democratic republic",
        "latvia",
        "lebanon",
        "liberia",
        "libya",
        "lithuania",
        "luxembourg",
        "macao",
        "madagascar",
        "malawi",
        "malaysia",
        "mali",
        "malta",
        "mauritania",
        "mexico",
        "moldova",
        "monaco",
        "mongolia",
        "morocco",
        "mozambique",
        "myanmar",
        "namibia",
        "nepal",
        "netherlands",
        "new zealand",
        "nicaragua",
        "niger",
        "nigeria",
        "norway",
        "oman",
        "pakistan",
        "palau",
        "palestine",
        "panama",
        "papua new guinea",
        "paraguay",
        "peru",
        "philippines",
        "pitcairn",
        "poland",
        "portugal",
        "qatar",
        "romania",
        "russian federation",
        "rwanda",
        "saudi arabia",
        "senegal",
        "serbia",
        "singapore",
        "slovakia",
        "slovenia",
        "somalia",
        "south africa",
        "spain",
        "sri lanka",
        "sudan",
        "suriname",
        "sweden",
        "switzerland",
        "syrian arab republic",
        "taiwan",
        "tanzania",
        "thailand",
        "tunisia",
        "turkey",
        "turkmenistan",
        "uganda",
        "ukraine",
        "united arab emirates",
        "united kingdom",
        "United States of America",
        "uruguay",
        "uzbekistan",
        "venezuela",
        "viet nam",
        "western sahara",
        "yemen",
        "zambia",
        "zimbabwe",

  ];

  final List<String> list_id = [
    "af",
    "al",
    "dz",
    "as",
    "ad",
    "ao",
    "ai",
    "aq",
    "ag",
    "ar",
    "am",
    "aw",
    "au",
    "at",
    "az",
    "bs",
    "bh",
    "bd",
    "bb",
    "by",
    "be",
    "bz",
    "bj",
    "bm",
    "bt",
    "bo",
    "ba",
    "bw",
    "bv",
    "br",
    "io",
    "bn",
    "bg",
    "bf",
    "bi",
    "kh",
    "cm",
    "ca",
    "cv",
    "ky",
    "cf",
    "td",
    "cl",
    "cn",
    "cx",
    "cc",
    "co",
    "km",
    "cg",
    "cd",
    "ck",
    "cr",
    "ci",
    "hr",
    "cu",
    "cy",
    "cz",
    "dk",
    "dj",
    "dm",
    "do",
    "ec",
    "eg",
    "sv",
    "gq",
    "er",
    "ee",
    "et",
    "fk",
    "fo",
    "fj",
    "fi",
    "fr",
    "gf",
    "pf",
    "tf",
    "ga",
    "gm",
    "ge",
    "de",
    "gh",
    "gi",
    "gr",
    "gl",
    "gd",
    "gp",
    "gu",
    "gt",
    "gn",
    "gw",
    "gy",
    "ht",
    "hm",
    "va",
    "hn",
    "hk",
    "hu",
    "is",
    "in",
    "id",
    "ir",
    "iq",
    "ie",
    "il",
    "it",
    "jm",
    "jp",
    "jo",
    "kz",
    "ke",
    "ki",
    "kp",
    "kr",
    "kw",
    "kg",
    "la",
    "lv",
    "lb",
    "ls",
    "lr",
    "ly",
    "li",
    "lt",
    "lu",
    "mo",
    "mk",
    "mg",
    "mw",
    "my",
    "mv",
    "ml",
    "mt",
    "mh",
    "mq",
    "mr",
    "mu",
    "yt",
    "mx",
    "fm",
    "md",
    "mc",
    "mn",
    "ms",
    "ma",
    "mz",
    "mm",
    "na",
    "nr",
    "np",
    "nl",
    "an",
    "nc",
    "nz",
    "ni",
    "ne",
    "ng",
    "nu",
    "nf",
    "mp",
    "no",
    "om",
    "pk",
    "pw",
    "ps",
    "pa",
    "pg",
    "py",
    "pe",
    "ph",
    "pn",
    "pl",
    "pt",
    "pr",
    "qa",
    "re",
    "ro",
    "ru",
    "rw",
    "sh",
    "kn",
    "lc",
    "pm",
    "vc",
    "ws",
    "sm",
    "st",
    "sa",
    "sn",
    "cs",
    "sc",
    "sl",
    "sg",
    "sk",
    "si",
    "sb",
    "so",
    "za",
    "gs",
    "es",
    "lk",
    "sd",
    "sr",
    "sj",
    "sz",
    "se",
    "ch",
    "sy",
    "tw",
    "tj",
    "tz",
    "th",
    "tl",
    "tg",
    "tk",
    "to",
    "tt",
    "tn",
    "tr",
    "tm",
    "tc",
    "tv",
    "ug",
    "ua",
    "ae",
    "gb",
    "us",
    "um",
    "uy",
    "uz",
    "vu",
    "ve",
    "vn",
    "vg",
    "vi",
    "wf",
    "eh",
    "ye",
    "yu",
    "zm",
    "zw"
  ];
  final List<Color?> list_color = [
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
    Colors.grey,
  ];
  bool timer_avviato = false;
  int index_lista = -1;
  String domanda = "";
  int punteggio = 0;

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
    timer_avviato = true;
    index_lista = Random().nextInt(list_id.length);
    domanda = "Trova: " + list_name[index_lista];
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    setState(() => myDuration = Duration(minutes: 1));
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(myDuration.inMinutes.remainder(60));
    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      domanda,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25),
                    ),
                    SizedBox(width: 50),
                    Text(
                      '$minutes:$seconds',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 50),
                    ),
                    SizedBox(width: 50),
                    Text(
                      "PUNTEGGIO: " + punteggio.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              InteractiveViewer(
                maxScale: 75.0,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.92,
                      // Actual widget from the Countries_world_map package.
                      child: SimpleMap(
                        instructions: SMapWorld.instructions,
                        colors: SMapWorldColors(
                          aF: list_color[0],
                          aL: list_color[1],
                          dZ: list_color[2],
                          aS: list_color[3],
                          aD: list_color[4],
                          aO: list_color[5],
                          aI: list_color[6],
                          aQ: list_color[7],
                          aG: list_color[8],
                          aR: list_color[9],
                          aM: list_color[10],
                          aW: list_color[11],
                          aU: list_color[12],
                          aT: list_color[13],
                          aZ: list_color[14],
                          bS: list_color[15],
                          bH: list_color[16],
                          bD: list_color[17],
                          bB: list_color[18],
                          bY: list_color[19],
                          bE: list_color[20],
                          bZ: list_color[21],
                          bJ: list_color[22],
                          bM: list_color[23],
                          bT: list_color[24],
                          bO: list_color[25],
                          bA: list_color[26],
                          bW: list_color[27],
                          bR: list_color[28],
                          iO: list_color[29],
                          bN: list_color[30],
                          bG: list_color[31],
                          bF: list_color[32],
                          bI: list_color[33],
                          kH: list_color[34],
                          cM: list_color[35],
                          cA: list_color[36],
                          cV: list_color[37],
                          kY: list_color[38],
                          cF: list_color[39],
                          tD: list_color[40],
                          cL: list_color[41],
                          cN: list_color[42],
                          cX: list_color[43],
                          cC: list_color[44],
                          cO: list_color[45],
                          kM: list_color[46],
                          cG: list_color[47],
                          cD: list_color[48],
                          cK: list_color[49],
                          cR: list_color[50],
                          hR: list_color[51],
                          cU: list_color[52],
                          cY: list_color[53],
                          cZ: list_color[54],
                          dK: list_color[55],
                          dJ: list_color[56],
                          dM: list_color[57],
                          dO: list_color[58],
                          eC: list_color[59],
                          eG: list_color[60],
                          sV: list_color[61],
                          gQ: list_color[62],
                          eR: list_color[63],
                          eE: list_color[64],
                          eT: list_color[65],
                          fK: list_color[66],
                          fO: list_color[67],
                          fJ: list_color[68],
                          fI: list_color[69],
                          fR: list_color[70],
                          gF: list_color[71],
                          pF: list_color[72],
                          tF: list_color[73],
                          gA: list_color[74],
                          gM: list_color[75],
                          gE: list_color[76],
                          dE: list_color[77],
                          gH: list_color[78],
                          gI: list_color[79],
                          gR: list_color[80],
                          gL: list_color[81],
                          gD: list_color[82],
                          gP: list_color[83],
                          gU: list_color[84],
                          gT: list_color[85],
                          gN: list_color[86],
                          gW: list_color[87],
                          gY: list_color[88],
                          hT: list_color[89],
                          hM: list_color[90],
                          hN: list_color[91],
                          hK: list_color[92],
                        ).toMap(),
                        // If the color of a country is not specified it will take in a default color.
                        defaultColor: Colors.grey,
                        // CountryColors takes in 250 different colors that will color each country the color you want. In this example it generates a random color each time SetState({}) is called.
                        callback: (id, name, tapdetails) {
                          print(id);
                          if (list_id[index_lista] == id) {
                            punteggio++;
                            list_color[index_lista] = Colors.green;
                            do {
                              index_lista = Random().nextInt(list_id.length);
                              domanda = "Trova: " + list_name[index_lista];
                            } while (list_color[index_lista] != Color                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            s.grey);
                          } else {}
                        },
                      ),
                    ),
                    // Creates 8% from right side so the map looks more centered.
                    Container(width: MediaQuery.of(context).size.width * 0.08),
                  ],
                ),
              ),
              Visibility(
                visible: !timer_avviato,
                child: ElevatedButton(
                  onPressed: startTimer,
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: stopTimer,
              //   child: Text(
              //     'Stop',
              //     style: TextStyle(
              //       fontSize: 30,
              //     ),
              //   ),
              // ),
              // ElevatedButton(
              //   onPressed: resetTimer,
              //   child: Text(
              //     'Reset',
              //     style: TextStyle(
              //       fontSize: 30,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
