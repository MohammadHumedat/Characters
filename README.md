# 🧠 Flutter Clean Architecture Learning App

A complete **Flutter learning project** built to demonstrate best practices for:

- Fetching data from APIs
- Using **BLoC/Cubit** for state management
- Implementing the **Repository pattern**
- Organizing code with **clean architecture**
- Applying **router navigation** for screens
- Adding **search functionality**
- Using **Hero animations** for smooth navigation transitions
- Customizing **SliverAppBar** for better UX
- Following clean **linting rules** and project conventions

---

## 🚀 Features

✅ Fetch data from REST API using **Dio / WebServices layer**
✅ Manage state using **BLoC / Cubit**
✅ Organize project with **Repository Pattern**
✅ Navigation via **AppRouters class**
✅ Implement **Search** filter inside GridView
✅ Add **Hero widget** for transition between Character list and details
✅ Beautiful **SliverAppBar** in details screen
✅ Handle loading, success, and error states gracefully
✅ Clean, modular, and readable project structure
✅ Proper **lint rules** configuration in `analysis_options.yaml`

---

## 📂 Project Structure

```
lib/
├── business_logic/
│   └── cubit/
│       └── character_cubit.dart
├── constants/
│   ├── colors.dart
│   └── strings.dart
├── core/
│   └── bloc_observer.dart
├── data/
│   ├── models/
│   │   └── character.dart
│   ├── repository/
│   │   └── characters_repository.dart
│   └── web_services/
│       └── characters_web_services.dart
├── presentation/
│   ├── screens/
│   │   ├── characters_screen.dart
│   │   └── characters_details.dart
│   └── widgets/
│       └── character_item.dart
└── app_router.dart
```

This structure follows **Clean Architecture principles**:

- **WebServices** → responsible for API calls
- **Repository** → connects data layer and business logic
- **Cubit/BLoC** → handles states and logic
- **Presentation** → displays data in UI

---

## ⚙️ Technologies & Packages

| Package                | Purpose                        |
| ---------------------- | ------------------------------ |
| `flutter_bloc`         | State management               |
| `dio`                  | API networking                 |
| `equatable`            | Easier Cubit state comparisons |
| `cached_network_image` | Efficient image loading        |
| `flutter_lints`        | Enforcing code style           |
| `google_fonts`         | Custom typography              |
| `animations`           | For Hero and transitions       |

---

## 🔍 Search Feature

Users can search for characters by name (case-insensitive).
It filters results dynamically inside the `GridView` using Cubit state updates.

---

## 🎨 UI Highlights

- **CharactersScreen**: Displays all characters in a responsive grid
- **CharacterItem**: Card with image and name
- **CharacterDetailsScreen**: Opens with smooth Hero transition + SliverAppBar
- **Error & Loading states** handled elegantly using widgets
- Consistent spacing, rounded corners, and shadows for a clean look

---

## 🧩 Routing

App navigation is managed by `AppRouters`:

```dart
switch (settings.name) {
  case ConstantStrings.characterScreen:
    return MaterialPageRoute(
      builder: (_) => BlocProvider(
        create: (context) => CharacterCubit(repository),
        child: const CharactersScreen(),
      ),
    );
  case ConstantStrings.characterScreenDetails:
    final character = settings.arguments as Character;
    return MaterialPageRoute(
      builder: (_) => CharactersDetails(character: character),
    );
}
```

---

## 🧱 State Management

Each feature has its own Cubit class (e.g. `CharacterCubit`) that:

- Fetches data via Repository
- Emits **Loading → Success → Error** states
- Allows filtering (search)

Example:

```dart
class CharacterCubit extends Cubit<CharacterState> {
  final CharactersRepository charactersRepository;

  CharacterCubit(this.charactersRepository) : super(CharacterInitial());

  void getAllCharacters() async {
    emit(CharacterLoading());
    try {
      final characters = await charactersRepository.getAllCharacters();
      emit(CharacterLoaded(characters));
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }
}
```

---

## 🧭 How to Run

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/Characters.git
   ```

2. Navigate to project folder:

   ```bash
   cd Characters
   ```

3. Get dependencies:

   ```bash
   flutter pub get
   ```

4. Run the app:

   ```bash
   flutter run
   ```

---

## 🎓 Learning Goals

This project is perfect for anyone who wants to:

- Learn **Flutter + BLoC/Cubit** from a real example
- Understand **Clean Architecture pattern**
- Practice **API fetching + Repository separation**
- Master **navigation, search, and Hero animation**
- Write clean and **lint-approved Flutter code**

---

## 🤝 Contributing

Feel free to fork, open issues, and submit pull requests.
This project is meant for learning and collaboration!

---

## 💬 Author

**Mohammad Hmedat**
👨‍💻 Software Engineer | Flutter & .NET Developer
📚 Passionate about clean code, architecture, and building learning projects
📧 [[humedat23@gmail.com](mailto:humedat23@gmail.com)]
