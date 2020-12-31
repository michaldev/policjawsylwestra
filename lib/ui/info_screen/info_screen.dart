import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

const description = '''
*Apka pomoże Ci w razie problemów lub gdy zostaniesz poszkodowany odnaleźć najbliższy patrol policji.*

Nie została stworzona przez Polską Policję i nie ma z nią nic wspólnego.

------

# Dane osobowe
Aplikacja nie zbiera żadnych danych osobowych. 


------


# Zasady

- Nigdy nie korzystaj z aplikacji podczas jazdy samochodem.
- Aplikacja nie daje żadnych gwarancji działania.
- Oprogramowanie jest darmowe i otwartoźródłowe.
''';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informacje o aplikacji'),
      ),
      body: Markdown(
        data: description,
      ),
    );
  }
}
