Aplikacja monitorująca patrole Policji w Sylwestra 2020. Wspierająca walkę z COVID'em w sposób prewencyjny.

Policja niezgodnie z konstytucją oraz słowami premiera Mateusza Morawieckiego prawdopodobnie zamierza[1] dnia 31 grudnia 2020 roku łamać najwysze prawo ograniczając swobody obywatelskie.

Źródło:
[1] https://biznes.radiozet.pl/News/Policja-poinformowala-czy-bedzie-wystawiac-mandaty-w-Sylwestra


Celem stworzenia aplikacji jest: 

- nauka programowania.
- ułatwienie ofiarom przestępstw uzyskanie pomocy, dzięki odnalezieniu najbliższego patrolu policji.
- wsparcie w ograniczaniu rozprzestrzeniania się koronawirusa (ograniczenie kumulacji wielu osób w jednym momencie + prewencja).
- odciążenie sądów, które po Nowym Roku mogą zostać zblokowane odwołaniami mandatów.
- pełnienie roli społeczno-edukacyjnej.
- pomoc policjantom - część z nich prawdopodobnie nie godzi się na to, niestety boją się na ryzykowne decyzje z powodu kryzysu.

Aplikacja może byc bezsensowna w innych krajach z mniej regorystycznymi przepisami i policją respektującą najwyższe prawo. 

Jak uruchomić projekt?
1. Pobierz repozytorium i uruchom w dowolnym edytorze.
2. Wpisz ```flutter packages pub run build_runner build```, żeby zbudować zależnosci dla mobx.
3. Zdobądź plik google-services.json. 
4. Uruchom, np. za pomocą ```flutter run```.


Lista zmian:
- Inicjalizacja projektu [17:20]
- Wstępny UI, poprawione README [18:10]
- Lokalizacja użytkownika, DI, oddzielenie klasy aplikacji [19:25]
- Wstępna konfiguracja Firebase'a [20:00]
- Ekran raportowania, podgląd markerków z bazy danych, aktualizowanie lokalizacji, ikona [00:10]
- Mapa w trybie ciemnym [00:25]
- Poprawione zapytania o lokalizację i apka wrzucona do Gplay (czeka na weryfikację) [03:18]