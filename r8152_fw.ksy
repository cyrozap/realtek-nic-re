meta:
  id: r8152_fw
  endian: le
  title: Firmware for Realtek USB NICs
  license: CC0-1.0
doc-ref:
  - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/usb/r8152.h
  - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/usb/r8152.c
seq:
  - id: checksum
    size: 32
  - id: version
    size: 32
    type: strz
    encoding: "utf-8"
  - id: fw_blocks
    type: fw_block
    repeat: eos
enums:
  fw_type:
    0: rtl_fw_end
    1: rtl_fw_pla
    2: rtl_fw_usb
    3: rtl_fw_phy_start
    4: rtl_fw_phy_stop
    5: rtl_fw_phy_nc
    6: rtl_fw_phy_fixup
    7: rtl_fw_phy_union_nc
    8: rtl_fw_phy_union_nc1
    9: rtl_fw_phy_union_nc2
    10: rtl_fw_phy_union_uc2
    11: rtl_fw_phy_union_uc
    12: rtl_fw_phy_union_misc
    13: rtl_fw_phy_speed_up
    14: rtl_fw_phy_ver
types:
  fw_block:
    seq:
      - id: type
        type: u4
        enum: fw_type
      - id: length
        type: u4
      - id: data
        size: length-8
        type:
          switch-on: type
          cases:
            fw_type::rtl_fw_pla: fw_mac
            fw_type::rtl_fw_usb: fw_mac
            fw_type::rtl_fw_phy_start: fw_phy_patch_key
            fw_type::rtl_fw_phy_nc: fw_phy_nc
            fw_type::rtl_fw_phy_fixup: fw_phy_fixup
            fw_type::rtl_fw_phy_union_nc: fw_phy_union
            fw_type::rtl_fw_phy_union_nc1: fw_phy_union
            fw_type::rtl_fw_phy_union_nc2: fw_phy_union
            fw_type::rtl_fw_phy_union_uc2: fw_phy_union
            fw_type::rtl_fw_phy_union_uc: fw_phy_union
            fw_type::rtl_fw_phy_union_misc: fw_phy_union
            fw_type::rtl_fw_phy_speed_up: fw_phy_speed_up
            fw_type::rtl_fw_phy_ver: fw_phy_ver
      - id: padding
        size: 8 - (length % 8)
        if: (length % 8) != 0
  fw_phy_set:
    seq:
      - id: addr
        type: u2
      - id: data
        type: u2
  fw_phy_speed_up:
    seq:
      - id: fw_offset
        type: u2
      - id: version
        type: u2
      - id: fw_reg
        type: u2
      - id: reserved
        type: u2
      - id: info
        size: fw_offset-16
        type: strz
        encoding: "utf-8"
      - id: data
        size-eos: true
  fw_phy_ver:
    seq:
      - id: ver
        type: fw_phy_set
      - id: reserved
        type: u4
  fw_phy_fixup:
    seq:
      - id: setting
        type: fw_phy_set
      - id: bit_cmd
        type: u2
      - id: reserved
        type: u2
  fw_phy_union:
    seq:
      - id: fw_offset
        type: u2
      - id: fw_reg
        type: u2
      - id: pre_set
        type: fw_phy_set
        repeat: expr
        repeat-expr: 2
      - id: bp
        type: fw_phy_set
        repeat: expr
        repeat-expr: 8
      - id: bp_en
        type: fw_phy_set
      - id: pre_num
        type: u1
      - id: bp_num
        type: u1
      - id: info
        size: fw_offset-58
        type: strz
        encoding: "utf-8"
      - id: data
        size-eos: true
  fw_mac:
    seq:
      - id: fw_offset
        type: u2
      - id: fw_reg
        type: u2
      - id: bp_ba_addr
        type: u2
      - id: bp_ba_value
        type: u2
      - id: bp_en_addr
        type: u2
      - id: bp_en_value
        type: u2
      - id: bp_start
        type: u2
      - id: bp_num
        type: u2
      - id: bp
        type: u2
        repeat: expr
        repeat-expr: 16
      - id: reserved
        type: u4
      - id: fw_ver_reg
        type: u2
      - id: fw_ver_data
        type: u1
      - id: info
        size: fw_offset-0x3f
        type: strz
        encoding: "utf-8"
      - id: data
        size-eos: true
  fw_phy_patch_key:
    seq:
      - id: key_reg
        type: u2
      - id: key_data
        type: u2
      - id: reserved
        type: u4
  fw_phy_nc:
    seq:
      - id: fw_offset
        type: u2
      - id: fw_reg
        type: u2
      - id: ba_reg
        type: u2
      - id: ba_data
        type: u2
      - id: patch_en_addr
        type: u2
      - id: patch_en_value
        type: u2
      - id: mode_reg
        type: u2
      - id: mode_pre
        type: u2
      - id: mode_post
        type: u2
      - id: reserved
        type: u2
      - id: bp_start
        type: u2
      - id: bp_num
        type: u2
      - id: bp
        type: u2
        repeat: expr
        repeat-expr: 4
      - id: info
        size: fw_offset-40
        type: strz
        encoding: "utf-8"
      - id: data
        size-eos: true
