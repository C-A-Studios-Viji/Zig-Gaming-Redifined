const std = @import("std");

const Game = enum { number_hunt, rock_paper_scissors, take_the_last };

fn title(game: Game) []const u8 {
    return switch (game) {
        .number_hunt => "Number Hunt",
        .rock_paper_scissors => "Rock Paper Scissors",
        .take_the_last => "Take the Last",
    };
}

pub fn main() void {
    std.debug.print("Unison is launching {s}!\n", .{title(.number_hunt)});
}
