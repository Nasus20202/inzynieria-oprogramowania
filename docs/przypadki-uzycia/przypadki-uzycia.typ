#set text(
  font: "New Computer Modern",
  size: 12pt,
)

#set page(
  paper: "a4",
  margin: (x: 1cm, y: 1cm),
  numbering: "1",
)

#set heading(numbering: "1.")

#align(center)[
  #stack(
    v(12pt),
    text(size: 20pt)[Przypadki użycia],
    v(12pt),
    text(size: 15pt)[Ada Kołodziejczak 193450, Krzysztof Nasuta 193328, Maciej Raciniewski 189774],
  )
]

= Aktorzy

== Klient
Jest klientem kina. Dzięki systemowi może rezerwować i kupować bilety do kina oraz przeglądać historie zakupów. Każdy klient jest zarejestrowany w systemie i posiada swój unikatowy numer identyfikacyjny.

== Kasjer
Jest pracownikiem kina. Dzięki systemowi może sprawdzać repertuar, dostępność miejsc oraz sprzedawać bilet klientowi.

== Kontroler biletów
Jest pracownikiem kina.

== Planista
Jest pracownikiem kina.

== Technicy Filmowi
Jest pracownikiem kina.

== System Płatności Przelewy24
Jest systemem współpracującym. Obsługuje transakcje online Klienta.

== Program księgowy
Jest systemem współpracującym. Otrzymuje dane od sprzedawcy o sprzedanych biletach.

== IMDb
Jest systemem współpracującym. Zapewnia

= Przypadki użycia