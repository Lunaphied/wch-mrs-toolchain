# Nixified WCH MounRiver Studio GCC 12 RISC-V Toolchain

This just wraps up and patches the toolchain to work under NixOS without fuss.

It requires you to download the toolchain file from the vendor website: https://www.mounriver.com/download

Just click on the Linux tab and then download the toolchain specifically not the studio package.

If the version has changed from 230 then you will need to update the derivations and change the `requireFile`
hash to the new hash and file path. The hash can be computed using `nix hash file <path_to_toolchain>`.

## Usage

Using the toolchain is as easy as `nix develop github:Lunaphied/wch-mrs-toolchain`. This will setup a shell that
also contains GNU Make and the wchisp flashing utility used by the built-in bootloader.

You can also get the pure toolchain package from `nix build github:Lunaphied/wch-mrs-toolchain`. 
