import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Translator extends StatefulWidget {
  @override
  _TranslatorState createState() => _TranslatorState();
}

class _TranslatorState extends State<Translator> {
  TextEditingController fromControler = TextEditingController();
  TextEditingController toControler = TextEditingController();
  final translator = GoogleTranslator();
  translateL() {
    translator
        .translate(fromControler.text, to: 'hi', from: 'en')
        .then((result) {
      setState(() {
        toControler.text = result.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Language Translator'),
        ),
        body: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: fromControler,
                decoration: InputDecoration(hintText: "Enter text"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: toControler,
                decoration: InputDecoration(hintText: "Translated text"),
              ),
            ),
            Center(
                child: FlatButton(
              child: Text(
                'Translate',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              onPressed: translateL,
              color: Colors.orange,
            )),
          ],
        ));
  }
}
