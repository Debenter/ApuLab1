# Przypisanie wartości do zmiennej a
a <- 2*log(5)

# Przypisanie podwójnej wartości zmiennej a do zmiennej b
b <- 3*a

# Funkcja sprawdzająca, która z wartości jest mniejsza
sprawdz <- function(x,y) {
  if(x < y){
    return("Wartość x jest mniejsza")
  } else if (x > y) {
    return("Wartośćy jest mniejsza")
  } else {
    return("Wartości są równe")
  }
}
# Wywołanie funkcji sprawdzającej dla zmiennych a i b
wynik <- sprawdz(a, b)
cat(wynik, "\n")

?min

# Tworzenie wektora a zawierającego liczby od 25 do 45
a <- 25:45

# Liczenie średniej kwadratów liczb
srednia_kwadratow <- mean(a^2)

# Wyświetlenie wyniku
cat("Średnia kwadratów liczb w wektorze a wynosi:", srednia_kwadratow, "\n")

# Wyszukaj funkcje zawierające frazę "median" w nazwie
apropos("median")

# Ustawienie dowolnego katalogu roboczego
setwd("C:/Users/danie/OneDrive/Pulpit/Apu")

# Stworzenie zmiennej a
a <- "macbooki Apple"

# Zapisanie zmiennej a do pliku
save(a, file = "zmienna_a.RData")

# Usunięcie zmiennej a
rm(a)

# Sprawdzenie wartości zmiennej a (powinno jej brakować)
print(a)

# Wczytanie pliku ze zmienną a
load("zmienna_a.RData")

# Sprawdzenie wartości zmiennej a
print(a)

# Instalacja pakietu gridExtra
install.packages("gridExtra")

# Ładowanie pakietu gridExtra
library(gridExtra)

# Wczytanie danych Orange
data("Orange")

# Wyświetlenie pierwszych 10 wierszy z wykorzystaniem funkcji tableGrob() z pakietu gridExtra
table <- tableGrob(head(Orange, 10), rows = NULL)

library(grid)

# Wyświetlenie tabeli
grid.draw(table)

# Instalacja i ładowanie pakietu gt
install.packages("gt")
library(gt)

# Wczytanie danych Orange
data("Orange")

# Tworzenie tabeli i wyświetlenie pierwszych 10 wierszy
gt(head(Orange, 10))


# Tworzenie wektora
wektor <- seq(200, 130, by = -5)

# Wyświetlenie wektora
print(wektor)

# Tworzenie wektorów a i b
a <- 19:5
b <- 11:23

# Tworzenie wektora d będącego połączeniem wektora b i a
d <- c(b, a)

# Wyświetlenie wektora d
print(d)


# Tworzenie wektora nazwa
nazwa <- c("MacBook Air 13.3 (2021)", "MacBook Pro 13.3 (2021)", "MacBook Pro 15 (2021)", "MacBook Pro 14 (2021)", "MacBook Pro 16 (2021)", "MacBook Pro 13.3 (2020)", "MacBook Pro 15 (2020)", "MacBook Pro 14 (2020)", "MacBook Air 13.3 (2020)", "MacBook Pro 16 (2020)")

# Tworzenie wektorów ekran (cale), pamięć_RAM (GB), dysk (GB), cena (USD), liczba_opinii
ekran <- c(13.3, 13.3, 15, 14, 16, 13.3, 15, 14, 13.3, 16)
pamiec_RAM <- c(8, 16, 16, 8, 32, 16, 16, 16, 8, 64)
dysk <- c(256, 512, 512, 256, 1024, 512, 1024, 512, 128, 2048)
cena <- c(1699, 1999, 2299, 1399, 2999, 1899, 2499, 1799, 1299, 3499)
liczba_opinii <- c(150, 120, 80, 100, 200, 90, 130, 70, 110, 180)

# Tworzenie ramki danych macbooki Apple
macbooki <- data.frame(nazwa, ekran, pamiec_RAM, dysk, cena, liczba_opinii)

# Wyświetlenie ramki danych
print(macbooki)

# Obliczenie średniej ceny macbooków
srednia_cena <- mean(macbooki$cena)
cat("Średnia cena macbookow:", srednia_cena, "\n")

nazwa <- "MacBook Pro 14 (2023)"
ekran <- 14
pamiec_RAM <- 16
dysk <- 512
cena <- 1699
liczba_opinii <- 85

# Dodanie nowego macbooka do ramki danych
nowy_macbook <- data.frame(nazwa, ekran, pamiec_RAM, dysk, cena, liczba_opinii)
macbooki <- rbind(macbooki, nowy_macbook)

# Wyświetlenie zaktualizowanej ramki danych
print(macbooki)

# Obliczenie średniej ceny macbooków po dodaniu nowego macbooka
srednia_cena_po_dodaniu <- mean(macbooki$cena)
cat("Nowa średnia cena macbooków:", srednia_cena_po_dodaniu, "\n")


# Ustawienie ziarna losowości dla reprodukowalności wyników
set.seed(42)

# Dodanie nowej kolumny z losowymi ocenami klientów
macbooki$ocena_klientow <- seq(from = 0, to = 5, by = 0.5)[sample(1:11, nrow(macbooki), replace=TRUE)]

# Wyświetlenie zaktualizowanej ramki danych
print(macbooki)

# Obliczenie średniej ceny dla każdej oceny
srednie_ceny_dla_ocen <- tapply(macbooki$cena, macbooki$ocena_klientow, mean)
print(srednie_ceny_dla_ocen)


# Dodanie kolejnych 4 macbooków
nowe_macbooki <- data.frame(
  nazwa = c("MacBook Air 13.3 (2022)", "MacBook Pro 15 (2022)", "MacBook Pro 14 (2022)", "MacBook Pro 16 (2022)"),
  ekran = c(13.3, 15, 14, 16),
  pamiec_RAM = c(16, 16, 8, 32),
  dysk = c(512, 1024, 256, 512),
  cena = c(1899, 2499, 1399, 2799),
  liczba_opinii = c(75, 110, 95, 140),
  ocena_klientow = seq(from = 0, to = 5, by = 0.5)[sample(1:11, 4, replace = TRUE)]
)


macbooki <- rbind(macbooki, nowe_macbooki)

# Narysowanie wykresu słupkowego
install.packages("ggplot2")
library(ggplot2)

ggplot(macbooki, aes(x = factor(ocena_klientow))) +
  geom_bar() +
  labs(x = "Ocena klientów", y = "Liczba macbooków") +
  ggtitle("Liczba macbooków dla każdej oceny klientów") +
  theme_minimal()
# Wykres kołowy
library(ggplot2)

wykres_kolowy <- ggplot(macbooki, aes(x = "", fill = factor(ocena_klientow))) +
  geom_bar(width = 1, color = "white") +
  coord_polar("y", start=0) +
  labs(fill = "Ocena klientów") +
  ggtitle("Procentowy udział ocen klientów (wykres kołowy)")

print(wykres_kolowy)

# Wykres wachlarzowy
wykres_wachlarzowy <- ggplot(macbooki, aes(x = factor(ocena_klientow))) +
  geom_bar() +
  labs(x = "Ocena klientów", y = "Liczba macbooków") +
  ggtitle("Procentowy udział ocen klientów (wykres wachlarzowy)") +
  theme_minimal()

print(wykres_wachlarzowy)

# Dodanie nowej kolumny status_opinii
macbooki$status_opinii <- cut(macbooki$liczba_opinii,
                             breaks = c(-Inf, 0, 50, 100, Inf),
                             labels = c("nie ma", "mniej niż 50 opinii", "50-100 opinii", "więcej niż 100 opinii"),
                             include.lowest = TRUE)

# Konwersja na cechy jakościowe
macbooki$status_opinii <- as.factor(macbooki$status_opinii)

# Wykres kołowy
library(ggplot2)

wykres_kolowy_status_opinii <- ggplot(macbooki, aes(x = "", fill = status_opinii)) +
  geom_bar(width = 1, color = "white") +
  coord_polar("y", start=0) +
  labs(fill = "Status opinii") +
  ggtitle("Procentowy udział macbooków według statusu opinii")

print(wykres_kolowy_status_opinii)

# Tworzenie zdań o macbookach
zdania_o_macbookach <- paste(macbooki$nazwa, "ma ocenę klientów", macbooki$ocena_klientow, "bo ma liczbę opinii", macbooki$liczba_opinii)

# Wyświetlenie zdań
print(zdania_o_macbookach)

# Zakładając, że ramka danych ma nazwę 'macbooki' i chcemy ją zapisać w pliku o nazwie 'macbooki_dane.csv'
write.csv(macbooki, file = "macbooki_dane.csv", row.names = FALSE)
# Wczytanie ramki danych z pliku 'macbooki_dane.csv' do zmiennej 'wczytane_macbooki'
wczytane_macbooki <- read.csv("macbooki_dane.csv")
print(wczytane_macbooki)