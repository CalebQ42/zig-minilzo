const std = @import("std");

pub fn build(b: *std.Build) void {
    const optimize = b.standardOptimizeOption(.{});
    const target = b.standardTargetOptions(.{});
    const pic = b.option(bool, "pic", "Produce Position Independent Code");

    var upstream = b.dependency("minilzo", .{});
    var lib = b.addLibrary(.{
        .name = "minilzo",
        .root_module = b.addModule("minilzo", .{
            .pic = pic,
            .target = target,
            .optimize = optimize,
        }),
    });
    lib.root_module.addCSourceFile(.{
        .flags = if (optimize == .Debug) &.{"-DLZO_DEBUG"} else &.{},
        .file = upstream.path("minilzo.c"),
    });
    lib.installHeadersDirectory(upstream.path(""), "lzo/", .{});
    b.installArtifact(lib);
}
