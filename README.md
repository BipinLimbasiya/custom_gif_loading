## Getting started

A customizable, simple, and easy to use loading with your GIF file.

![myfile](https://raw.githubusercontent.com/BipinLimbasiya/custom_gif_loading/main/assets/GIF/gif.gif)

## Installing #

Add this to your package's pubspec.yaml file:

```dart
dependencies:
  custom_gif_loading: ^latest
```

## Import #

```dart
import 'package:custom_gif_loading/custom_gif_loading.dart';
```

## How to use #

First, Add your GIF file in asset :

```dart
 Image gif = Image.asset('add your gif file');
```

Then, Start the loading with pass your gif:

```dart
 Loading(gif).start(context);
```

Stop the loading:

```dart
  Loading.stop();
```

## Customize #

```dart
  Image gif = Image.asset('add your gif file');
```


