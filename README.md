![Header](/images/header.png)


A clock face app built with Flutter. It's a clock hand, inside a clock hand, inside a clock hand!


## About Recursive Clock

This app is an analog clock face built for the [Flutter Clock contest](https://flutter.dev/clock). Its hands are rings nested inside each other. It has a light theme and a dark theme, and displays temperature, weather and location data.

The intersection of the red ring with the blue one indicates the hour. The intersection of the yellow ring with the red one indicates the minutes. The intersection of the green ring with the yellow one indicates the seconds.

Can you tell what time is it?

![Light theme](/images/light.png)
![Dark theme](/images/dark.png)

### Recursive Clock app architecture

The Recursive Clock is built around a MVVM-like architecture, as described by the following diagram.

![Diagram](/images/diagram.png)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine.

* Install the latest version of Flutter's stable channel in your machine. See the official [get started with Flutter guide](https://flutter.dev/get-started/) for more information.
* Clone the repository with `git clone https://github.com/drogel/recursive_clock`.
* Open an emulator or connect an Android/iOS device to your machine and run the app with `flutter run`.


## Built With

* [Flutter](https://flutter.dev/) - Google's open-source mobile SDK.
* [Dart Intl package](https://pub.dev/packages/intl) - A Dart package for localized messages, date and number formatting.
* [Flutter Clock Helper package](https://github.com/flutter/flutter_clock/tree/master/flutter_clock_helper) - A Flutter package that provides scaffolding code for the clock in the Flutter Clock contest.


## Authors

* **Diego Rogel** - Development and design - [GitHub](https://github.com/drogel)
* **Andrea Colina** - Design - [GitHub](https://github.com/andreaacolina)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
