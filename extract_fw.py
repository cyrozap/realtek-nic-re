#!/usr/bin/env python3
# SPDX-License-Identifier: 0BSD

# Copyright (C) 2023 by Forest Crossman <cyrozap@gmail.com>
#
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
# AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
# DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
# PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
# TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.


import argparse
import struct
import sys
from datetime import datetime
from hashlib import sha256

try:
    import r8152_fw
except ModuleNotFoundError:
    sys.stderr.write("Error: Failed to import \"r8152_fw.py\". Please run \"make\" in this directory to generate that file, then try running this script again.\n")
    sys.exit(1)


def print_mac(data):
    print("  fw_reg: 0x{:04x}".format(data.fw_reg))
    print("  bp_ba_addr: 0x{:04x}".format(data.bp_ba_addr))
    print("  bp_ba_value: 0x{:04x}".format(data.bp_ba_value))
    print("  bp_en_addr: 0x{:04x}".format(data.bp_en_addr))
    print("  bp_en_value: 0x{:04x}".format(data.bp_en_value))
    print("  bp_start: 0x{:04x}".format(data.bp_start))
    print("  bp:")
    for i, bp in enumerate(data.bp[:data.bp_num]):
        print("    0x{:04x} ({})".format(bp, "Enabled" if data.bp_en_value & (1 << i) else "Disabled"))
    print("  fw_ver_reg: 0x{:04x}".format(data.fw_ver_reg))
    print("  fw_ver_data: 0x{:02x}".format(data.fw_ver_data))
    print("  info: {}".format(data.info))

def extract_data(filename, info, data):
    out_name = "{}.{}.bin".format(filename, info)
    out = open(out_name, 'wb')
    out.write(data)
    out.close()
    print("Wrote firmware data to \"{}\".".format(out_name))

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("firmware", type=str, help="The firmware binary you want to extract from.")
    args = parser.parse_args()

    fw_data = open(args.firmware, 'rb').read()
    fw = r8152_fw.R8152Fw.from_bytes(fw_data)

    print("Firmware version: {}".format(fw.version))
    calculated = sha256(fw_data[32:]).digest()
    print("Firmware hash: {} ({})".format(fw.checksum.hex(),
         "OK" if fw.checksum == calculated else "ERROR: Calculated value is {}".format(calculated.hex())))

    for block in fw.fw_blocks:
        if block.type == r8152_fw.R8152Fw.FwType.rtl_fw_pla:
            print("rtl_fw_pla:")
            print_mac(block.data)
            extract_data(args.firmware, "rtl_fw_pla.{}".format(block.data.info), block.data.data)
        elif block.type == r8152_fw.R8152Fw.FwType.rtl_fw_usb:
            print("rtl_fw_usb:")
            print_mac(block.data)
            extract_data(args.firmware, "rtl_fw_usb.{}".format(block.data.info), block.data.data)
        elif block.type == r8152_fw.R8152Fw.FwType.rtl_fw_phy_start:
            print("rtl_fw_phy_start:")
            print("  key_reg: 0x{:04x}".format(block.data.key_reg))
            print("  key_data: 0x{:04x}".format(block.data.key_data))
        elif block.type == r8152_fw.R8152Fw.FwType.rtl_fw_phy_nc:
            data = block.data
            print("rtl_fw_phy_nc:")
            print("  fw_reg: 0x{:04x}".format(data.fw_reg))
            print("  ba_reg: 0x{:04x}".format(data.ba_reg))
            print("  ba_data: 0x{:04x}".format(data.ba_data))
            print("  patch_en_addr: 0x{:04x}".format(data.patch_en_addr))
            print("  patch_en_value: 0x{:04x}".format(data.patch_en_value))
            print("  mode_reg: 0x{:04x}".format(data.mode_reg))
            print("  mode_pre: 0x{:04x}".format(data.mode_pre))
            print("  mode_post: 0x{:04x}".format(data.mode_post))
            print("  bp_start: 0x{:04x}".format(data.bp_start))
            print("  bp:")
            for bp in data.bp[:data.bp_num]:
                print("    0x{:04x}".format(bp))
            print("  info: {}".format(data.info))
            extract_data(args.firmware, "rtl_fw_phy_nc.{}".format(block.data.info), block.data.data)
        elif block.type == r8152_fw.R8152Fw.FwType.rtl_fw_phy_speed_up:
            data = block.data
            print("rtl_fw_phy_speed_up:")
            print("  fw_offset: 0x{:04x}".format(data.fw_offset))
            print("  version: 0x{:04x}".format(data.version))
            print("  fw_reg: 0x{:04x}".format(data.fw_reg))
            print("  info: {}".format(data.info))
            extract_data(args.firmware, "rtl_fw_phy_speed_up.{}".format(block.data.info), block.data.data)
        elif block.type == r8152_fw.R8152Fw.FwType.rtl_fw_phy_stop:
            print("rtl_fw_phy_stop")
        elif block.type == r8152_fw.R8152Fw.FwType.rtl_fw_end:
            print("rtl_fw_end")
        else:
            print("Unhandled type: {}: {}".format(block.type, block.data))


if __name__ == "__main__":
    main()
