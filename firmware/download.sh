#!/bin/bash
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


# https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=b27d12383e7a3049812007cded2f44e7e8769742
curl -o rtl8153a-2.2019-10-23.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8153a-2.fw?id=b27d12383e7a3049812007cded2f44e7e8769742
curl -o rtl8153a-3.2019-10-23.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8153a-3.fw?id=b27d12383e7a3049812007cded2f44e7e8769742
curl -o rtl8153a-4.2019-10-23.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8153a-4.fw?id=b27d12383e7a3049812007cded2f44e7e8769742
curl -o rtl8153b-2.2019-10-23.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8153b-2.fw?id=b27d12383e7a3049812007cded2f44e7e8769742

# https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=6f89735800fe3af761104defdb81b50b6d6402f0
curl -o rtl8153a-3.2020-02-07.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8153a-3.fw?id=6f89735800fe3af761104defdb81b50b6d6402f0
curl -o rtl8153a-4.2020-02-07.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8153a-4.fw?id=6f89735800fe3af761104defdb81b50b6d6402f0

# https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=bc3e61020299824cab4a5093622ab3d77bcb84d2
curl -o rtl8153c-1.2021-03-31.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8153c-1.fw?id=bc3e61020299824cab4a5093622ab3d77bcb84d2
curl -o rtl8156a-2.2021-04-15.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8156a-2.fw?id=bc3e61020299824cab4a5093622ab3d77bcb84d2
curl -o rtl8156b-2.2021-04-15.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8156b-2.fw?id=bc3e61020299824cab4a5093622ab3d77bcb84d2

# https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=ef8643d39c2dcef1a7424803bbeb8194c593d368
curl -o rtl8153c-1.2021-08-19.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8153c-1.fw?id=ef8643d39c2dcef1a7424803bbeb8194c593d368

# https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=e88bdbe4b5a98370e30f8b6cbbfebf09cd604b4d
curl -o rtl8153b-2.2023-04-27.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8153b-2.fw?id=e88bdbe4b5a98370e30f8b6cbbfebf09cd604b4d
curl -o rtl8156a-2.2023-04-27.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8156a-2.fw?id=e88bdbe4b5a98370e30f8b6cbbfebf09cd604b4d
curl -o rtl8156b-2.2023-04-27.fw https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/plain/rtl_nic/rtl8156b-2.fw?id=e88bdbe4b5a98370e30f8b6cbbfebf09cd604b4d
