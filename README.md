# sdup-labs
Laboratoria Systemy Dedykowane w Układach Programowalnych (2025/26), AGH

## How to use git?

1. Przed poczatkiem pracy oraz przed kazdym git add/commit uzyc:
```bash
git pull origin main
```

To pobierze wszystkie zmiany z repo na twoj komputer

2. Dodalem plik .gitignore - teraz w komendzie git status powinno pokazywac tylko pliki `.v` oraz `.xdc`

3. Po zmianach w kodzie zastosowac:
```bash
git pull origin main #sprawdza zmiany w repo na github
git status -uall # pokazuje ktore pliki sie zmienily
git add plik1 plik2
git commit -m "Wiadomosc commita"
git push origin main # wyslanie plikow do repo
```