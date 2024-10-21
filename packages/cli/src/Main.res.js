// Generated by ReScript, PLEASE EDIT WITH CARE
'use strict';

var Nodefs = require("node:fs");
var Process = require("process");
var Nodepath = require("node:path");
var BundleNRequire = require("bundle-n-require");

var BundleNRequire$1 = {};

var cssFunction = "\n@module(\"./css\")\nexternal css: {..} => string = \"css\"\n";

var configPath = Nodepath.join(Process.cwd(), "panda.config.js");

async function get() {
  return (await BundleNRequire.bundleNRequire(configPath)).mod;
}

var Config = {
  configPath: configPath,
  get: get
};

function createBindingsModule(config) {
  var styledSystemDir = Nodepath.join(Process.cwd(), config.outdir, "PandaCSS.res");
  var content = "\n    " + cssFunction + "\n  ";
  Nodefs.writeFileSync(styledSystemDir, Buffer.from(content));
  console.log("✅ Created PandaCSS module.");
}

async function run() {
  var config = await get();
  console.log(config);
  return createBindingsModule(config);
}

run();

var Process$1;

exports.BundleNRequire = BundleNRequire$1;
exports.cssFunction = cssFunction;
exports.Process = Process$1;
exports.Config = Config;
exports.createBindingsModule = createBindingsModule;
exports.run = run;
/* configPath Not a pure module */