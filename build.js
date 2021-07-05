const esbuild = require("esbuild");
const autoprefixer = require("autoprefixer");
const tailwindcss = require("tailwindcss");
const postCssPlugin = require("@deanc/esbuild-plugin-postcss");

esbuild
  .build({
    entryPoints: ["./src/App.bs.js"],
    bundle: true,
    sourcemap: true,
    target: ['chrome58', 'firefox57', 'safari11', 'edge16'],
    outfile: "./www/dist/bundle.js",
    watch: true,
    define: { 'process.env.NODE_ENV': '"production"' },
    plugins: [
      postCssPlugin({
        plugins: [autoprefixer, tailwindcss],
      }),
    ],
  })
  .catch((e) => console.error(e.message));