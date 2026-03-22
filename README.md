# minilzo

[minilzo](https://www.oberhumer.com/opensource/lzo/) packaged for [zig](https://ziglang.org).

## How to use it

First, update your `build.zig.zon`:

```
zig fetch --save git+https://github.com/CalebQ42/zig-minilzo.git
```

Next, add this snippet to your `build.zig` script:

```zig
const minilzo_dep = b.dependency("minilzo", .{
    .target = target,
    .optimize = optimize,
});
your_compilation.linkLibrary(minilzo_dep.artifact("minilzo"));
```

This will provide zlib-ng as a static library to `your_compilation`. To mirror how lzo is often packaged, header files are provided inside of `lzo/` so to include the header file use `@cInclude("lzo/minilzo.h")`.
