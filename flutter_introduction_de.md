


# innFactory Flutter Introduction <img src="./docs/innFactoryIcon.svg" width="50" height="50">


  [1. Übersichtsseite](#1-übersichtsseite)
  [2. Bild einbauen](#2-hintergrundbild-einbauen)
  [3. Kreativ werden](#3-kreativ-werden)


## 1. Übersichtsseite


Hierfür soll eine neue Seite Erstellt werden, auf der man Statistiken zu den vorhandenen Todos sieht. Auf diese Seite soll durch die Bottom Navigation Bar zugegriffen werden können. Die Todo Informationen sollen aus der lokalen Datenbank geladen werden.
Hier sollen folgende Daten zu sehen sein:
    - Anzahl der offenen Todos
    - Anzahl der abgeschlossenen Todos

Erstelle hierfür ein File `todo_overview_page.dart` in dem Ordner `app/lib/router/authenticated/todo/`

Dieses File soll ein Widget beinhalten und dieses Widget benötigt einen [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html?gclid=Cj0KCQjw1aOpBhCOARIsACXYv-cGAELjJyviPhOwC1N0cme0-NuMZjf9uK-oYzPhU9oVCW0sCSm9UBYaAn1eEALw_wcB&gclsrc=aw.ds). Für die Benutzeroberfläche sind bereits einige Bausteine in Flutter integriert, die du verwenden kannst. Beispiele hierfür findest du im [Widget Catalog](https://docs.flutter.dev/ui/widgets).

Um diese Seite der Bottom Navigation Bar hinzuzufügen, muss diese mit `@RoutePage()` gekennzeichnet werden(vgl. todo_page.dart).
Anschließend muss der Code Generator ausgeführt werden. Gib hierfür `melos run codegen` in die Konsole ein.
Dannach muss diese Seite dem Router hinzugefügt werden. Der Router befindet sich im `app/lib/router/router.dart` file. Und zuletzt muss diese Route im File `app/lib/router/authenticated/home_page.dart` eingefügt werden.


Um die Daten in die UI zu laden, implementiere Methoden in der Klasse `todo_dao_impl.dart` die dir jeweils einen int Stream mit der Anzahl der offenen bzw. abgeschlossenen Todos zurückgeben.

Diese Streams werden jetzt durch Stream Provider in die UI gebracht. Beispiele für Stream Provider findest du in `packages/todo/lib/src/application/todo_stream_provider.dart` und für die Einbindung in die UI in `app/lib/router/authenticated/todo/todo_page.dart`.



## 2. Hintergrundbild einbauen

Auf der Übersichtsseite soll ein Hintergrundbild eingestellt werden können. Das Bild wird mit einem [Image Picker](https://pub.dev/packages/image_picker) von dem Gerät ausgewählt und soll in der Applications Directory gespeichert werden ([Dokumentation](https://docs.flutter.dev/cookbook/persistence/reading-writing-files)), damit dieses dauerhaft in der App verfügbar ist.

Der neue Pfad des Bildes muss in einem Key-Value-Store gespeichert werden, um das Bild später wieder in die Benutzeroberfläche laden zu können.
Benutze hierfür den bereits in der App vorhanden SimpleKVStore. Beispiele für die Verwendung von diesem findest du in `packages/auth/lib/src/infrastructure/auth_repository_impl.dart`.

Implementiere jetzt ein Repository, das folgende Funktionen bereitstellt:
- Abspeichern des Bildes in der Applications Directory
- Abspeichern des neuen Bild Pfades in dem Key-Value-Store
- Stream zum Laden des Bildpfades

Erstelle jetzt für das Repository einen Provider. Ein Beispiel hierfür ist in `packages/auth/lib/src/provider/auth_repository_provider.dart`.
Jetzt erstelle wie bei Schritt 1 einen Stream Provider und binde den Stream zum Laden des Bildpfades in die Benutzeroberfläche ein und baue das Hintergrundbild in die UI ein.

## 3. Kreativ werden
Überarbeite die Todo List Tiles(`packages/todo/lib/src/domain/view/todo_list_tile.dart`), um mit der Entwicklung in der UI in Flutter vertraut zu werden und neue Dinge auszuprobieren. Beispiele für fertige Bausteine findest du wieder im [Widget Catalog](https://docs.flutter.dev/ui/widgets).





