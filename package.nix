{
  stdenv,
  autoPatchelfHook,
  requireFile,
  writeShellScript,
}:
stdenv.mkDerivation {
  pname = "wch-mrs-toolchain";
  version = "230";

  src = requireFile {
    name = "MRS_Toolchain_Linux_x64_V230.tar.xz";
    url = "https://www.mounriver.com/download";
    hash = "sha256-YjKlKGbp7UJc7Wg4+ZtGEm+CHZqJbHZlebeQ2OHu3lQ=";
    #description = "Go to the Linux section and download the toolchain specifically.";
  };

  builder = writeShellScript "extract-and-patch.sh" ''
    tar -xvf $src "Toolchain/RISC-V Embedded GCC12"
    mv "Toolchain/RISC-V Embedded GCC12/" $out
    autoPatchelf $out
  '';

  buildInputs = [ stdenv.cc.cc ];

  nativeBuildInputs = [ autoPatchelfHook ];

}
