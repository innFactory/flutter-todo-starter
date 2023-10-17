


# innFactory Flutter Introduction <img src="./docs/innFactoryIcon.svg" width="50" height="50">


  [1. Overview page](#1-overview-page)
  [2. Include Background Image](#2-include-background-image)
  [3. Be creative](#3-be-creative)


## 1. Overview page

For this purpose, a new page should be created, on which you can see the statistics of the existing todos. This page should be accessible through the bottom navigation bar. The todos information should be loaded from the local database.
The following data should be displayed here:
    - Number of open todos
    - Number of completed todos

Create a file `todo_overview_page.dart` in the folder `app/lib/router/authenticated/todo/` for this purpose.

This file should contain a widget and this widget needs a [Scaffold](https://api.flutter.dev/flutter/material/Scaffold-class.html?gclid=Cj0KCQjw1aOpBhCOARIsACXYv-cGAELjJyviPhOwC1N0cme0-NuMZjf9uK-oYzPhU9oVCW0sCSm9UBYaAn1eEALw_wcB&gclsrc=aw.ds). For the user interface, there are already a few ready to use components built into Flutter that you can use. You can find examples in the [Widget Catalog](https://docs.flutter.dev/ui/widgets).

To add this page to the Bottom Navigation Bar, it must be marked with `@RoutePage()`(cf. todo_page.dart).
Afterwards the code generator must be executed. To do this, type `melos run codegen` in the console.
Then this page must be added to the router. The router is located in the `app/lib/router/router.dart` file. And finally this route must be added to the `app/lib/router/authenticated/home_page.dart` file.


To load the data into the UI, implement methods in the class `todo_dao_impl.dart` that return an int stream with the number of open or closed todos.

These streams are now loaded into the UI via stream providers. You can find examples for stream providers in `packages/todo/lib/src/application/todo_stream_provider.dart` and examples for the integration into the UI in `app/lib/router/authenticated/todo/todo_page.dart`.



## 2. Include background image

It should be possible to set a background image on the overview page. The image is selected from the device with an [Image Picker](https://pub.dev/packages/image_picker) and has to be saved in the Applications Directory of the Device ([Documentation](https://docs.flutter.dev/cookbook/persistence/reading-writing-files)) so that it is permanently available in the app.

The new path of the image must be stored in a key-value store to be able to load the image back into the user interface.
Use the SimpleKVStore that is already implemented in the application for this. Examples for using this store be found in `packages/auth/lib/src/infrastructure/auth_repository_impl.dart`.

Now implement a repository that provides the following functions:
- Saving the image in the Applications Directory
- Saving the new image path in the key-value store
- Stream to load the image path

Now create a provider for the repository. An example of this is in `packages/auth/lib/src/provider/auth_repository_provider.dart`.
Now create a stream provider as in step 1 and use the stream to load the image path in the UI and implement the background image in the UI.

## 3. Be creative
Revise the Todo List Tiles(`packages/todo/lib/src/domain/view/todo_list_tile.dart`) to get familiar with UI development in Flutter. Again, you can find examples of ready to use components in the [Widget Catalog](https://docs.flutter.dev/ui/widgets).





