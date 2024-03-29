import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/theme.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'sura_details';

  const SuraDetailsScreen({super.key});

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> ayat = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SuraDetailsArgs args =
        ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
    loadSurafile(args.index);
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/default_bg.png'),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: Text(args.suraName),
          ),
          
          body: Container(decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(25),),
          margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.05, horizontal: MediaQuery.of(context).size.width * 0.05),
            padding: const EdgeInsets.all(20  
          ),
          child:
          ListView.builder(
            itemBuilder: (context, index) => Text(ayat[index]),
            itemCount: ayat.length,
          ),
          
        )
        )
        );
  }

  Future<void> loadSurafile(int index) async {
    String sura = await rootBundle.loadString('assets/files/${index + 1}.txt');
    ayat = sura.split('\n');
    print(ayat.length);
    setState(() {
      
    });
  }
}

class SuraDetailsArgs {
  int index;
  String suraName;
  SuraDetailsArgs({required this.index, required this.suraName});
}
