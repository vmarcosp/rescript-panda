const path = require("path");
const fs = require("fs");

const installMacLinuxBinary = (binary) => {
  const source = path.join(__dirname, binary);
  if (fs.existsSync(source)) {
    const target = path.join(__dirname, "ppx");
    fs.renameSync(source, target);

    fs.chmodSync(target, 0o777);
  }
};

switch (process.platform) {
  case "linux":
    installMacLinuxBinary("ppx-linux.exe");
    break;
  case "darwin":
    installMacLinuxBinary("ppx-macos.exe");
    break;
  default:
    console.warn(`No release available for "${process.platform}"`);
    process.exit(1);
}
