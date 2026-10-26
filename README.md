# Zig — Gaming Redifined
## Unison browser arcade

**Play three simple games in your browser. No compiler, installation or account needed.**

### Start playing

1. Open [index.html](https://github.com/C-A-Studios-Viji/Zig-Gaming-Redifined/blob/main/index.html).
2. Use GitHub's **Download raw file** button.
3. Open the downloaded `index.html` in a browser.
4. Pick Number Hunt, Rock Paper Scissors or Take the Last.

Alternatively, download this repository as a ZIP, extract it and open `index.html`.

GitHub's file preview shows source code; download the file to play.
This repository update does not enable GitHub Pages hosting.

### Games

- **Number Hunt:** guess a number from 1–50 in seven attempts.
- **Rock Paper Scissors:** first to three wins; draws do not count.
- **Take the Last:** take 1–3 stones per turn; whoever takes the final stone wins.

Use **Start again** to reset the current game. Switching games starts a fresh round.
The arcade has no saved scores, external dependencies or network requests.

### Read

[Six-paragraph article: Zig — Gaming Redifined](ARTICLE.md)

### Implementation

**Zig is the arcade's name.** The current browser edition uses HTML, CSS and JavaScript.
The earlier native Zig prototype remains in `src/main.zig`, with its small example in
`examples/launcher.zig`; neither is required for the browser edition.

### Verification

JavaScript checks passed for invalid guesses, guessing wins and losses, all nine
Rock Paper Scissors outcomes, match wins and losses, legal stone moves, both stone-game winners,
and game resets. These checks ran in Node with a minimal DOM stub; visual rendering and
real browser interaction have not been verified.
