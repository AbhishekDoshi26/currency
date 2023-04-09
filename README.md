# Currency 💸

##### A Currency Conversion App that converts any currency to USD.

---

### APIs Used 👨🏻‍💻
- List of Currencies: https://openexchangerates.org/api/currencies.json
- Latest Exchange Rates with base currency USD: https://openexchangerates.org/api/latest.json?app_id=YOUR_APP_ID

###### *You can get your own APP_ID from [openexchangerates.org](https://openexchangerates.org "openexchangerates.org")*

---

### Packages Used 📦
| Package Name | Usage   |
| ------------ | ------------ |
|flutter_bloc| It is used for state management of the entire application.  |
|  equatable | It is used along with bloc for checking the equal instances of objects for event and state classes.  |
| flutter_dotenv  | It is used to securely store the APP_ID for the API without pushing it to GitHub.  |
| flutter_launcher_icons  |  It is used to generate the app icons for ios and android. |
| google_fonts  | It is used for the custom font of the app.  |
| rect_getter  | It is used for to get the Rect of the widget for Ripple effect.  |
| http  | It is used for API calls.  |
| json_serializable (dev_dependencies)  | It is used to serialise model from json and jso from model.  |
|build_runner (dev_dependencies)| It is used for automatically generating files with json_serializable.
| json_annotation  |  It is used along with json_serializable.  |
|shared_preferences|It is used for local storage.|

---

### Installation 🛠️
As the project uses `flutter_dotenv`, there are few steps to follow:
- Clone the repository.
- Create your account on [openexchangerates.org](https://openexchangerates.org "openexchangerates.org") and get your APP_ID.
- Create a new file called `.env` in the root of your project and create a variable in it called `APP_ID` and paste your app id in as a string. For example, `APP_ID = '1234567890'`
- Now you are good to go 🚀

---

### Features 📱
- Store your favourite currencies in local storage.
- Search for a particular currency.
- Convert any currency to USD.
- Delete any currency from your favourite.

---

### Main Attractions 🏓
- Minimal UI.
- Smooth Animations.
- Rates gets updated every hour.
- Keep track of your favourite currencies.

---

### Output 🎨
https://user-images.githubusercontent.com/52591247/230778160-179d1eb1-6a37-451e-a9af-c84cad080451.mov


