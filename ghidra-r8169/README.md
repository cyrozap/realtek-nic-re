# ghidra-r8169

A Ghidra processor module for the firmware-loading bytecode parsed by the r8169
driver.

**WARNING:** While the instruction decoding functionality is complete, the
instruction semantics are not entirely correct. Specifically, the handling of
register offsets is not yet complete, and there's some complexity in how
register offsets are handled between the PHY and MAC\_MCU spaces and between
chips of different generations that has not yet been implemented. If you choose
to use this processor module, you do so at your own peril.


## Building

Follow the instructions in [build.gradle](build.gradle).


## License

[APLv2](LICENSE.txt).
