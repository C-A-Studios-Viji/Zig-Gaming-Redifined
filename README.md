# Unison — Zig: Gaming Redifined

A small native terminal arcade written in **Zig**, paired with a six-paragraph article about the language.

## Read the article

[Zig: Gaming Redifined — benefits, downsides and its potential impact](ARTICLE.md)

The article includes a short, standalone Zig example. Its runnable source is [examples/launcher.zig](examples/launcher.zig).

## Play

Three games share one menu:

- **Number Hunt:** find a random number from 1–50 in seven guesses.
- **Rock Paper Scissors:** play the computer; first to three wins.
- **Take the Last:** alternate taking 1–3 stones; the last stone wins.

This is a terminal application. It does not run inside a GitHub webpage.

### Requirements

Install **Zig 0.15.2** from the [official archive](https://ziglang.org/download/0.15.2/release-notes.html).
This project pins that version; newer compiler releases are not claimed as tested.
The launcher uses C standard I/O through Zig's C interoperability; game rules and input validation are written in Zig. No external game framework is required.

### Build and run (macOS / Linux)

```sh
zig build-exe src/main.zig -lc -O ReleaseSafe -femit-bin=unison
./unison
```

### Build and run (Windows PowerShell)

```powershell
zig build-exe src/main.zig -lc -O ReleaseSafe -femit-bin=unison.exe
.\unison.exe
```

Enter a menu number and press Enter. Invalid input is rejected. EOF exits cleanly.
Rock Paper Scissors also accepts 0 to return to the menu. Ctrl+C stops the application.

### Short example and tests

```sh
zig run examples/launcher.zig
zig test src/main.zig -lc
zig fmt --check src/main.zig examples/launcher.zig
```

## Scope

A compact learning project with built-in games, rather than an installer for third-party titles.
Scores last for the current match; there is no account system, saved progress, graphics or audio.
Random moves use `std.crypto.random`. The computer in Take the Last chooses legal random moves, so it is beatable.

## Validation

Compiled and tested locally with Zig 0.15.2 on Linux in ReleaseSafe mode.
Checks cover every Rock Paper Scissors outcome, menu validation, overlong input, EOF,
and complete playthroughs of all three games. macOS and Windows commands are provided,
but have not been executed on those operating systems.
