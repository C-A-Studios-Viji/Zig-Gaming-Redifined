# Zig: Gaming Redifined

Sometimes you just want to play something for five minutes. You do not want to install a huge launcher, create another account or spend your break figuring out how to start. That is the idea behind **Zig**, our small arcade in the Unison project. It brings three simple games together in one screen, with clear buttons and a quick way to start again. The aim is straightforward: make it easy to get into a game and enjoy a few rounds.

There is also a programming language called Zig, which inspired the original version of this project. Its appeal is the amount of control it gives developers over their software. Memory allocation is explicit, and a mandatory garbage collector does not decide when to clean things up. For someone building performance-sensitive software, that can be useful. It gives them more say over where resources go, although good performance still depends on how well the program is designed. [1][2]

The language has other interesting strengths. Zig can work with C libraries, which means developers can build on existing work. Its cross-compilation tools help target different platforms, while a feature called `comptime` lets suitable work happen during compilation. These are practical reasons to explore it. If Zig has a lasting influence on coding, it could come from helping people build useful tools and libraries that fit into software they already use. That is a possibility worth exploring, rather than a promise that it will replace everything else. [1][2]

Of course, extra control comes with extra responsibility. Developers still have to think carefully about memory and mistakes that runtime safety checks cannot prevent. Those checks also depend on the build settings. For a small game project, there is another question: how easily can someone actually play it? A terminal program may suit someone who enjoys compiling code, but it adds steps for someone who simply wants to click a button. Choosing a language involves weighing that experience alongside the technical benefits. [1]

For the updated arcade, we chose HTML, CSS and JavaScript and kept **Zig** as the game launcher's name. This browser edition is not written in the Zig programming language. It includes Number Hunt, where you chase a hidden number; Rock Paper Scissors, where the first to three wins takes the match; and Take the Last, where you try to claim the final stone. Everything sits in one downloadable HTML file, so there is no compiler or account setup between you and a round of play.

You can find it in the [Zig: Gaming Redifined repository](https://github.com/C-A-Studios-Viji/Zig-Gaming-Redifined). To play, open [index.html on GitHub](https://github.com/C-A-Studios-Viji/Zig-Gaming-Redifined/blob/main/index.html), choose **Download raw file**, and open the downloaded file in your browser. The project is small, but that is part of its appeal: you can play it, look through the code and change something without having to understand a huge application first. For anyone curious about coding, making one little game work can be a satisfying place to start.

## Sources

1. [Official Zig overview](https://ziglang.org/learn/overview/)
2. [Why Zig?](https://ziglang.org/learn/why_zig_rust_d_cpp/)
