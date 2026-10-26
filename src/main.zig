const std = @import("std");
const c = @cImport({
    @cInclude("stdio.h");
});

fn say(text: [:0]const u8) void {
    _ = c.puts(text);
}

// Read a complete line, including overlong input, so leftovers never become moves.
fn number(prompt: [:0]const u8, low: u8, high: u8) ?u8 {
    while (true) {
        _ = c.fputs(prompt, c.stdout);
        _ = c.fflush(c.stdout);
        var buf: [32]u8 = undefined;
        var len: usize = 0;
        var too_long = false;
        while (true) {
            const ch = c.getchar();
            if (ch == c.EOF) return null;
            if (ch == 10) break;
            if (len < buf.len) {
                buf[len] = @intCast(ch);
                len += 1;
            } else {
                too_long = true;
            }
        }
        if (!too_long) {
            const value = std.fmt.parseInt(u8, std.mem.trim(u8, buf[0..len], " \r\t"), 10) catch {
                say("Please enter a whole number.");
                continue;
            };
            if (value >= low and value <= high) return value;
        }
        say("That entry is outside the allowed range.");
    }
}

fn hunt() void {
    const secret = std.crypto.random.intRangeAtMost(u8, 1, 50);
    say("\nNUMBER HUNT | Find the number from 1 to 50 in seven guesses.");
    for (0..7) |_| {
        const guess = number("Your guess: ", 1, 50) orelse return;
        if (guess == secret) {
            say("Found it! You win.");
            return;
        }
        say(if (guess < secret) "Go higher." else "Go lower.");
    }
    _ = c.printf("Out of guesses! The number was %u.\n", @as(c_uint, secret));
}

fn outcome(player: u8, computer: u8) enum { draw, win, lose } {
    if (player == computer) return .draw;
    return if ((player + 3 - computer) % 3 == 1) .win else .lose;
}

fn rps() void {
    say("\nROCK PAPER SCISSORS | First to three wins. 0 returns to launcher.");
    var wins: u8 = 0;
    var losses: u8 = 0;
    while (wins < 3 and losses < 3) {
        const choice = number("1 Rock / 2 Paper / 3 Scissors / 0 Back: ", 0, 3) orelse return;
        if (choice == 0) return;
        const computer = std.crypto.random.intRangeAtMost(u8, 0, 2);
        const names = [_][:0]const u8{ "Rock", "Paper", "Scissors" };
        _ = c.printf("Computer: %s\n", names[computer].ptr);
        switch (outcome(choice - 1, computer)) {
            .draw => say("Draw."),
            .win => {
                wins += 1;
                say("You win the round!");
            },
            .lose => {
                losses += 1;
                say("Computer wins the round.");
            },
        }
        _ = c.printf("Score: you %u - computer %u\n", @as(c_uint, wins), @as(c_uint, losses));
    }
    say(if (wins == 3) "You win the match!" else "Computer wins the match.");
}

fn take() void {
    say("\nTAKE THE LAST | 15 stones. Take 1-3 per turn. Last stone wins.");
    var stones: u8 = 15;
    while (stones > 0) {
        _ = c.printf("Stones remaining: %u\n", @as(c_uint, stones));
        const move = number("Take: ", 1, @min(3, stones)) orelse return;
        stones -= move;
        if (stones == 0) {
            say("You took the last stone. You win!");
            return;
        }
        const bot = std.crypto.random.intRangeAtMost(u8, 1, @min(3, stones));
        stones -= bot;
        _ = c.printf("Computer takes %u.\n", @as(c_uint, bot));
        if (stones == 0) say("Computer took the last stone. Computer wins.");
    }
}

pub fn main() void {
    say("UNISON | Zig: Gaming Redifined");
    while (true) {
        say("\n1 Number Hunt\n2 Rock Paper Scissors\n3 Take the Last\n0 Quit");
        const choice = number("Choose a game: ", 0, 3) orelse break;
        switch (choice) {
            1 => hunt(),
            2 => rps(),
            3 => take(),
            else => break,
        }
    }
    say("Thanks for playing Unison!");
}

test "all nine rock paper scissors pairings" {
    const expected = [3][3]@TypeOf(outcome(0, 0)){
        .{ .draw, .lose, .win },
        .{ .win, .draw, .lose },
        .{ .lose, .win, .draw },
    };
    for (expected, 0..) |row, p| {
        for (row, 0..) |result, bot| {
            try std.testing.expectEqual(result, outcome(@intCast(p), @intCast(bot)));
        }
    }
}
