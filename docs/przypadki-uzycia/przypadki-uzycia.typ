#set text(
  font: "New Computer Modern",
  size: 12pt,
)

#set page(
  paper: "a4",
  margin: (x: 1cm, y: 1cm),
  numbering: "1",
)

#let level = 2
#set heading(numbering: (..numbers) => if numbers.pos().len() <= level {
  return numbering("1.", ..numbers)
})

#align(center)[
  #stack(
    v(12pt),
    text(size: 22pt)[Przypadki użycia - Kino],
    v(12pt),
    text(size: 12pt)[_Inżynieria oprogramowania_],
    v(12pt),
    text(size: 15pt)[Ada Kołodziejczak 193450, Krzysztof Nasuta 193328, Maciej Raciniewski 189774],
  )
]

= Diagram przypadków użycia

#align(center)[#image(height: 80%, "diagram.png")]

= Aktorzy

== Klient
Jest klientem kina. Dzięki systemowi może przeglądać repertuar, czytać informacje o filmach z serwisu IMDb oraz rezerwować bilety do kina. Każdy klient może zarejestrować się w systemie. W takim przypadku posiada swój unikatowy numer identyfikacyjny. Rejestracja umożliwia kupno, pobranie oraz zwrot biletów do kina, a także przeglądanie historii zakupów. Jeżeli klient chce zorganizować swoje wydarzenie w jednej z sal kinowych, po zalogowaniu może również dokonać rezerwacji sali.

== Kasjer
Jest pracownikiem kina. Dzięki systemowi może sprawdzać repertuar, dostępność miejsc oraz sprzedawać i drukować bilety klientom w kasie kina.

== Kontroler biletów
Jest pracownikiem kina. Dzięki systemowi może w łatwy sposób weryfikować poprawność biletów oraz sprawdzać, czy dany bilet został już wykorzystany.

== Planista
Jest pracownikiem kina. Dzięki systemowi może sprawdzać oraz modyfikować repertuar.

== Technik Filmowy
Jest pracownikiem kina. Dzięki systemowi może sprawdzać repertuar oraz wyświetlać lokalizacje przechowywania filmów.

== System Płatności Przelewy24
Jest systemem współpracującym. Obsługuje płatności realizowane przez klienta.

== Program księgowy
Jest systemem współpracującym. Otrzymuje dane o sprzedanych biletach.

== IMDb
Jest systemem współpracującym. Zapewnia informacje o filmach w tym ich opisy, oceny i zwiastuny.

= Przypadki użycia

== Założenie konta w serwisie

=== Warunki początkowe
- Klient niezalogowany

=== Przebieg
+ Klient zgłasza żądanie utworzenia nowego konta.
+ Klient wybiera e-mail oraz hasło do nowego konta.
+ System weryfikuje, czy nie istnieje konto założone na podany e-mail (wyjątek: "Konto o podanym adresie e-mail istnieje").
+ System weryfikuje, czy podane hasło spełnia wymagania (wyjątek: "Hasło jest zbyt słabe").
+ System tworzy unikatowy numer identyfikacyjny.

=== Przebiegi alternatywne
3a: Wyjątek: "Konto o podanym adresie e-mail istnieje" \
3a1. System informuje użytkownika, że podany e-mail już jest wykorzystywany. \
3a2. Zakładanie konta jest przerywane.

4a: Wyjątek: "Hasło jest zbyt słabe" \
4a1. System informuje użytkownika, że hasło jest zbyt słabe. \
4a2. Powrót do punktu 4.

=== Warunki końcowe
- Nowe konto w serwisie zostało utworzone

== Logowanie
=== Warunki początkowe
- Klient niezalogowany

=== Przebieg
+ Klient zgłasza żądanie logowania.
+ System prosi o uwierzytelnienie.
+ Klient podaje swój e-mail/unikatowy numer identyfikacyjny oraz hasło.
+ System weryfikuje podaną informacje (wyjątek: "Niewłaściwy login lub hasło").

=== Przebiegi alternatywne
4a: Wyjątek: "Niewłaściwy login lub hasło" \
4a1. System informuje użytkownika o niepowodzeniu logowania. \
4a2. Powrót do punktu 3.

=== Warunki końcowe
- Klient zalogowany

== Sprawdzanie repertuaru kina
=== Warunki początkowe
- Brak

=== Przebieg
+ Klient zgłasza żądanie sprawdzenia repertuaru kina. Posiada możliwość określenia ilości dni (do 30, domyślnie 7).
+ System prezentuje klientowi listę filmów, które będą wyświetlane w wybranych dniach. Informacje zawierają:
  - tytuł filmu,
  - datę seansu,
  - godzinę rozpoczęcia.
+ Klient może wybrać określony film i sprawdzić jego szczegóły z IMDb (przypadek: "Wyświetlanie ocen oraz zwiastunów z IMDb na stronie").
+ Klient może sprawdzić, czy są dostępne miejsca na dany seans (przypadek: "Sprawdzanie wolnych miejsc w sali online").

=== Przebiegi alternatywne
- Brak
=== Warunki końcowe
- Brak

== Wyświetlanie ocen oraz zwiastunów z IMDb na stronie
=== Warunki początkowe
- System w trybie sprawdzania repertuaru kina - widoczna lista filmów.

=== Przebieg
+ Klient zgłasza żądanie wyświetlenia ocen oraz zwiastunów z IMDb.
+ Pobieranie informacji z serwisu IMDb
+ System prezentuje klientowi oceny oraz zwiastun.

=== Przebiegi alternatywne
- Brak.

=== Warunki końcowe
- Brak.

== Sprawdzanie wolnych miejsc w sali online
=== Warunki początkowe
- System w trybie sprawdzania repertuaru kina - widoczna lista filmów.

=== Przebieg
- Klient zgłasza żądanie wyświetlenia wolnych miejsc na wybrany przez niego seans.
- System sprawdza, które miejsca zostały już zajęte i wyświetla informację klientowi.
- Klient ma możliwość rezerwacji biletu (przypadek: "Rezerwacja biletu").
- Jeżeli klient jest zalogowany, ma możliwość kupna biletu (przypadek: "Zakup biletu")

=== Przebiegi alternatywne
- Brak.

=== Warunki końcowe
- Brak.

== Rezerwacja biletu
=== Warunki początkowe
- System w trybie sprawdzania wolnych miejsc - widoczna lista miejsc na sali.

=== Przebieg
- Klient zgłasza żądanie rezerwacji miejsca.
- Klient wybiera dostępne miejsca (wolne) (wyjątek:"Brak dostępnych miejsc")
- System prosi o imię w celu późniejszego potwierdzenia rezerwacji
- Klient podaje imię

=== Przebiegi alternatywne
1-4: W każdym z tych kroków klient ma możliwość przerwania rezerwacji.

2a. Wyjątek:"Brak dostępnych miejsc".\
2a1. System informuje o braku miejsc na seans.\
2a2. Rezerwowanie miejsc jest przerywane.

=== Warunki końcowe
- Bilet zarezerwowany na podane imię.

== Zakup biletu
=== Warunki początkowe
- Klient zalogowany.
- System w trybie sprawdzania wolnych miejsc - widoczna lista miejsc na sali.

=== Przebieg
+ Klient widzi dostępne miejsca w sali. Może wybrać miejsca, które go interesują.
+ Klient zgłasza żądanie zakupu biletu.
+ System prosi o potwierdzenie wyboru miejsca oraz przedstawia cenę biletu.
+ Klient potwierdza i przechodzi do płatności.
+ System przekierowuje klienta do systemu płatności Przelewy24, gdzie klient dokonuje płatności (przypadek: "Płatność za bilet" oraz wyjątek: "Płatność nie powiodła się").
+ System zapisuje zakupiony bilet w bazie danych.

=== Przebiegi alternatywne
1-4: W każdym z tych kroków klient ma możliwość przerwania zakupu.

5a: Wyjątek: "Płatność nie powiodła się" \
5a1. System informuje klienta o niepowodzeniu płatności. \
5a2. Proces zakupu jest przerywany.

=== Warunki końcowe
- Bilet zakupiony.

== Płatność
=== Warunki początkowe
- Klient zalogowany.
- Klient wybrał i potwierdził zakup.

=== Przebieg
+ Klient wybiera metodę płatności.
+ System żąda danych wymaganych przez daną metodę płatności.
+ Klient podaje dane (wyjątek: "Niepoprawne dane")
+ System weryfikuje płatność (wyjątek: "Błąd płatności")

=== Przebiegi alternatywne
3a: Wyjątek: "Niepoprawne dane" \
3a1. System Przelewy24 informuje klienta o niepoprawnych danych. \
3a2. Klient ma możliwość ponownego wyboru metody płatności (powrót do punktu 2).

4a: Wyjątek: "Błąd płatności" \
4a1. System Przelewy24 informuje klienta o niepowodzeniu płatności. \
4a2. Klient ma możliwość ponownego wyboru metody płatności (powrót do punktu 2).

=== Warunki końcowe
- System otrzymuje potwierdzenie realizacji płatności od Przelewy24.

== Rezerwacja sali na specjalne wydarzenia
=== Warunki początkowe
- Klient zalogowany.

=== Przebieg
+ Klient zgłasza żądanie rezerwacji sali na specjalne wydarzenie.
+ Klient wybiera datę, godzinę oraz salę.
+ System sprawdza dostępność sali w podanym terminie oraz przedstawia informację o kosztach (wyjątek: "Sala zajęta").
+ Klient potwierdza rezerwację.
+ System przekierowuje klienta do systemu płatności Przelewy24, gdzie klient dokonuje płatności (przypadek: "Płatność za rezerwację sali" oraz wyjątek: "Płatność nie powiodła się").
+ System zapisuje rezerwację w bazie danych.

=== Przebiegi alternatywne
1-4: W każdym z tych kroków klient ma możliwość przerwania rezerwacji.

3a: Wyjątek: "Sala zajęta" \
3a1. System informuje klienta o zajętości sali w podanym terminie. \
3a2. Klient ma możliwość wyboru innego terminu (powrót do punktu 2).

5a: Wyjątek: "Płatność nie powiodła się" \
5a1. System informuje klienta o niepowodzeniu płatności. \
5a2. Proces rezerwacji jest przerywany.

=== Warunki końcowe
- Wybrana sala zarezerwowana na podaną datę i godzinę.

== Przeglądanie historii zakupów użytkownika
=== Warunki początkowe
- Klient jest zalogowany.

=== Przebieg
- Klient zgłasza żądanie przeglądania historii zakupów użytkownika.
- System wyświetla poprzednie zakupy użytkownika.

=== Przebiegi alternatywne
- Brak.

=== Warunki końcowe
- Brak.

== Zwrot biletów
=== Warunki początkowe

=== Przebieg

=== Przebiegi alternatywne

=== Warunki końcowe

== Pobranie pliku z zakupionym biletem
=== Warunki początkowe

=== Przebieg

=== Przebiegi alternatywne

=== Warunki końcowe

