meta:
  id: r8169_fw
  endian: le
  title: Firmware for Realtek PCI/PCIe NICs
  license: CC0-1.0
doc-ref:
  - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/realtek/r8169_firmware.h
  - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/ethernet/realtek/r8169_firmware.c
seq:
  - id: magic
    type: u4
enums:
  rtl_fw_opcode:
    0x0: phy_read
    0x1: phy_data_or
    0x2: phy_data_and
    0x3: phy_bjmpn
    0x4: phy_mdio_chg
    0x7: phy_clear_readcount
    0x8: phy_write
    0x9: phy_readcount_eq_skip
    0xa: phy_comp_eq_skipn
    0xb: phy_comp_neq_skipn
    0xc: phy_write_previous
    0xd: phy_skipn
    0xe: phy_delay_ms
types:
  fw_info:
    seq:
      - id: magic
        type: u4
      - id: version
        size: 32
        type: strz
        encoding: "utf-8"
      - id: fw_start
        type: u4
      - id: fw_len
        type: u4
      - id: chksum
        type: u1
    instances:
      fw_data:
        io: _root._io
        pos: fw_start
        type: action
        repeat: expr
        repeat-expr: fw_len
  fw_raw:
    seq:
      - id: actions
        type: action
        repeat: eos
  action:
    seq:
      - id: raw
        type: u4
    instances:
      op:
        value: raw >> 28
        enum: rtl_fw_opcode
      regno:
        value: (raw >> 16) & 0x0FFF
      val:
        value: raw & 0xFFFF
instances:
  fw:
    pos: 0
    size-eos: true
    type:
      switch-on: magic
      cases:
        0: fw_info
        _: fw_raw
