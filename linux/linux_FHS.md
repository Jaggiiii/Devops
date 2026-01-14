# FILE HIERARCHY SYSTEM
It defines where things should live in Linux.

# 1.bin -->binary.
contains basic commands required for normal usage and system recovery
What it is:
Essential user commands
Who uses it:
Normal users + root
ls      # list files
cp      # copy files
mv      # move files
cat     # view file content
bash    # shell
echo
pwd



# 2.sbin --> system binary.
/sbin contains system-level commands meant for administrators
What it is:
System administration commands
Who uses it:
Root (administrator) only

ip        # network configuration
mount     # mount filesystems
reboot
shutdown
fsck      # filesystem check
iptables


## /boot

**What it is:**  
Boot-related directory

**Purpose:**  
Contains files required to start (boot) the Linux system.

### What it contains
- **Linux Kernel**
  - `vmlinuz-*`
- **Initramfs / Initrd**
  - `initramfs-*.img`
- **Bootloader files**
  - `grub/`
  - `grub.cfg`
- **System.map**
  - Kernel symbol table used for debugging

**Key Point:**  
`/boot` holds everything needed to load the Linux kernel into memory.
# Linux FHS — /dev Directory Notes
---

3.## /dev
**What it is:**  
Directory that contains **device files**
**Purpose:**  
Allows programs to **communicate with hardware devices** as if they were files.
> In Linux: **Everything is a file**, including hardware.
---
## What is a Device File?
- A **special file** representing a hardware or virtual device
- Used to **read from or write to devices**
- Created and managed by the kernel (via `udev`)
---
## Types of Devices in /dev
### 1️⃣ Character Devices
- Data is transferred **character by character**
- No buffering
**Examples:**
- `/dev/tty` – terminal
- `/dev/null` – discards all data
- `/dev/random` – random data generator
- `/dev/zero` – outputs zeros
---
### 2️⃣ Block Devices
- Data transferred in **blocks**
- Supports buffering
- Mostly storage devices
**Examples:**
- `/dev/sda` – first hard disk
- `/dev/sda1` – first partition
- `/dev/nvme0n1` – NVMe disk
---
## Common /dev Files
| Device | Purpose |
|------|--------|
| `/dev/null` | Discards output |
| `/dev/zero` | Produces zero bytes |
| `/dev/random` | Random data |
| `/dev/urandom` | Faster random data |
| `/dev/tty` | Current terminal |
| `/dev/sda` | Hard disk |
| `/dev/sda1` | Disk partition |
---

## How /dev Works Internally
1. System boots
2. Kernel detects hardware
3. `udev` creates device files in `/dev`
4. Applications access hardware via these files
---

## Important Characteristics
- `/dev` is **dynamic**
- Files appear and disappear based on hardware
- Not regular files (special file types)
---

## Simple Analogy
- Hardware = real machine
- `/dev` file = remote control for that machine
---
## Why /dev is Important
- Enables interaction with disks, terminals, USB, printers
- Required for mounting disks, I/O operations, networking
---
## One-Line Interview Answer
> `/dev` contains device files that represent hardware and virtual devices, allowing programs to interact with them as files.
---
## Related Commands
```bash
ls /dev
lsblk
mount /dev/sda1 /mnt


# /etc — Linux FHS Notes
## What it is
System configuration directory.
## Purpose
Stores system-wide configuration files that control how the OS and services behave.
## What it contains
Configuration files (mostly text), service configs, network settings, user/auth settings.
❌ No binaries ❌ No user data ❌ No large files

## Common files
- `/etc/passwd` – user accounts
- `/etc/shadow` – encrypted passwords
- `/etc/group` – group info
- `/etc/hostname` – system name
- `/etc/hosts` – IP ↔ hostname mapping
- `/etc/fstab` – filesystem mount info
- `/etc/resolv.conf` – DNS config
- `/etc/os-release` – OS info

## Important directories
- `/etc/systemd/` – systemd configs
- `/etc/ssh/` – SSH config
- `/etc/network/` – network config
- `/etc/nginx/` – Nginx config
- `/etc/docker/` – Docker config
- `/etc/kubernetes/` – Kubernetes configs
## Characteristics
Mostly human-readable text files. Editing requires root access. Changes apply immediately or after service restart.
## How it works
Programs read configuration from `/etc` at startup and behave accordingly.
## Analogy
`/etc` = system settings menu.
## One-line answer
`/etc` contains system-wide configuration files for Linux and its services.


# /lib, /lib32, /lib64 — Linux FHS Notes

## /lib
**What it is:** Essential shared libraries directory  
**Purpose:** Contains shared libraries required by programs in `/bin` and `/sbin`, and kernel modules.
**What it contains:**
- Shared libraries: `libc.so`, `libm.so`
- Kernel modules: `/lib/modules/`
**Key point:**  
Without `/lib`, the system cannot boot or run basic commands.
---
## /lib64
**What it is:** 64-bit shared libraries directory  
**Purpose:** Stores shared libraries for 64-bit binaries.
**Used on:**  
64-bit Linux systems.
**Example:**
- `libc.so.6`
- `ld-linux-x86-64.so.2`
**Key point:**  
64-bit programs load libraries from `/lib64`.
---
## /lib32
**What it is:** 32-bit shared libraries directory  
**Purpose:** Stores shared libraries for 32-bit binaries.
**Used on:**  
64-bit systems that support running 32-bit applications.
**Key point:**  
Allows compatibility with older or 32-bit software.
---
## Comparison Table
| Directory | Used for | System Type |
|--------|---------|------------|
| `/lib` | Essential system libraries | All systems |
| `/lib64` | 64-bit libraries | 64-bit OS |
| `/lib32` | 32-bit libraries | Multi-arch OS |
---
## How it works
When a program starts:
1. Loader checks required libraries
2. Libraries are loaded from `/lib`, `/lib64`, or `/lib32`
3. Program executes
---
## Analogy
- `/lib` → engine parts
- `/lib64` → engine parts for big engines (64-bit)
- `/lib32` → engine parts for small engines (32-bit)
---
## One-line interview answer
`/lib`, `/lib32`, and `/lib64` store essential shared libraries needed by system and application binaries.
# /mnt — Linux FHS Notes
## What it is
Temporary mount directory.
## Purpose
Used to **manually mount filesystems** temporarily.
## What it contains
Mounted storage like:
- Hard disks
- USB drives
- CDs/DVDs
- Network filesystems
## Typical usage
System administrators mount devices here for testing or temporary access.
## Example
```bash
mount /dev/sdb1 /mnt
umount /mnt


# /opt — Linux FHS Notes

## What it is
Optional application software directory.

## Purpose
Used to install **third-party or add-on software** that is not part of the default OS.

## What it contains
- Self-contained application directories
- Each app usually has its own folder

Example:
```text
/opt/google/
/opt/oracle/
/opt/vscode/


# /proc — Linux FHS Notes
## What it is
Virtual (pseudo) filesystem.
## Purpose
Provides **live information about the kernel and running processes**.
## Important point
Files in `/proc` are **not stored on disk**.
They are created **in memory by the kernel**.
## What it contains
- Process information
- Kernel information
- System hardware details
## Process directories
Each running process has a directory:
```text
/proc/1234/


# /root — Linux FHS Notes
## What it is
Home directory of the root user.
## Purpose
Stores personal files, configs, and scripts of the **root (administrator)** user.
## Important point
`/root` is **NOT** the root filesystem `/`.
`/` → root filesystem  
`/root` → home directory of root user
## What it contains
- Root user’s files
- Root-specific config files
- Admin scripts
## Difference from /home
- `/home/user` → normal users
- `/root` → root user only
## Characteristics
- Accessible only by root
- Separate from `/home` for security
- Exists even if `/home` is on another partition
## Why it exists
Allows root to log in and work even if `/home` is unavailable.
## Analogy
`/root` = admin’s personal workspace.
## One-line answer
`/root` is the home directory of the root (administrator) user.


# /run — Linux FHS Notes

## What it is
Runtime data directory.

## Purpose
Stores **temporary system information created after boot**.

## Important point
`/run` exists **only in memory (RAM)**.
Contents are **lost after reboot**.

## What it contains
- Process ID (PID) files
- Lock files
- Runtime state data

Examples:
- `/run/systemd/`
- `/run/sshd.pid`
- `/run/docker/`
- `/run/user/1000/`

## Who uses it
System services and daemons.

## Why /run exists
Replaces old directories like:
- `/var/run`
- `/var/lock`

## Characteristics
- Very fast (RAM-based)
- Automatically cleaned on reboot
- Created early during boot

## Analogy
`/run` = system’s temporary working memory.

## One-line answer
`/run` stores temporary runtime data for system processes.


# snap is used to store snap packages init.

# /snap — Linux Notes (Snap Packages)

## What it is
Directory used by **Snap package manager**.

## Purpose
Stores **snap-installed applications** and their files.

## What is Snap
Snap is a **package management system** by Canonical (Ubuntu).
It installs applications as **self-contained packages**.

## What /snap contains
Each snap app has its own directory:
```text
/snap/postman/
/snap/docker/
/snap/code/

hy optional Snap apps do NOT go into /opt
Short answer
Because Snap does not follow the traditional FHS /opt rule.

# /srv — Linux FHS Notes

## What it is
Service data directory.

## Purpose
Stores **data served by system services**.

## What it contains
Data used by services like:
- Web servers
- FTP servers
- File servers

Examples:
```text
/srv/www/
/srv/ftp/
/srv/git/

# /sys — Linux FHS Notes

## What it is
Virtual filesystem (sysfs).

## Purpose
Provides a **structured view of kernel objects and hardware**.

## Important point
Files in `/sys` are **not stored on disk**.
They are created **in memory by the kernel**.

## What it contains
- Device information
- Kernel modules
- Hardware buses

Examples:
```text
/sys/class/
/sys/devices/
/sys/module/


# /tmp — Linux FHS Notes

## What it is
Temporary files directory.

## Purpose
Stores **short-lived temporary files** created by applications and users.

## What it contains
- Temp files
- Cache files
- Intermediate data

Examples:
```text
/tmp/file.tmp
/tmp/app-cache/


# /usr — Linux FHS Notes        
## What it is
User system resources directory.
## Purpose
Stores **read-only system-wide programs, libraries, and data**.
## What /usr contains
- `/usr/bin` – user commands
- `/usr/sbin` – admin commands
- `/usr/lib` – libraries
- `/usr/share` – architecture-independent data
## Important point
`/usr` is **NOT user home**.
User home directories are in `/home`.
## Characteristics
- Mostly read-only
- Shareable across systems
- Not required for early boot
## Difference from /bin and /sbin
- `/bin`, `/sbin` → minimal tools for boot
- `/usr/bin`, `/usr/sbin` → full-featured tools
## Modern Linux note
On many systems:
- `/bin` → symlink to `/usr/bin`
- `/sbin` → symlink to `/usr/sbin`
## Analogy
`/usr` = system applications folder.
## One-line answer
`/usr` contains user-level system programs, libraries, and shared data.

# /var — Linux FHS Notes

## What it is
Variable data directory.

## Purpose
Stores **files that change frequently** during system operation.

## What /var contains
- Logs → `/var/log/`
- Spool files → `/var/spool/` (mail, print)
- Cache → `/var/cache/`
- Temporary files → `/var/tmp/`
- Databases → `/var/lib/`

## Important point
- `/var` is **writable and dynamic**
- Data persists across reboots (except `/var/run` replaced by `/run`)

## Difference from /tmp
- `/tmp` → short-term temporary files, often cleared on reboot
- `/var/tmp` → long-term temporary files, preserved after reboot

## Analogy
`/var` = system’s working folder for changing data.
## One-line answer
`/var` stores variable system data like logs, caches, spools, and databases.
# /home — Linux FHS Notes
## What it is
User home directory parent folder.
## Purpose
Stores **personal directories for regular users**.
## What /home contains
- Each user gets a subdirectory:
```text
/home/john/
/home/alice/


# note

Think of Linux like a city, each directory has a role:
1️⃣ Root area
/ → The city itself (root filesystem)
/root → The mayor’s house (root user’s home)
/home → Everyone else’s houses (user directories)
2️⃣ Daily essentials
/bin → Basic tools for everyone (like hammer, screwdriver)
/sbin → Admin-only tools (wrench, drill for repairs)
/lib, /lib64 → Tool parts (libraries needed by tools)
3️⃣ Optional / extra stuff
/opt → Extra apps you install manually
/snap → Extra apps installed via Snap (app store style)
4️⃣ System config
/etc → Control center / settings (system configs)
5️⃣ Running system info
/proc → Live dashboard of processes
/sys → Live dashboard of hardware and kernel
/run → System working memory (runtime temp info)
6️⃣ Temporary / changing data
/tmp → Scratchpad for temp files
/var → Workspace for logs, mail, cache, databases, long-term temp files
7️⃣ Mount points / services
/mnt → Temporary parking for disks
/media → Auto-mounted USB/CD
/srv → Data for services (web, FTP, git)
8️⃣ Shared programs and data

/usr → Applications, libraries, read-only data for users and system
/usr/bin → user commands
/usr/sbin → admin commands
/usr/lib → libraries
/usr/share → shared data
Memory Trick
Root & homes: /, /root, /home → people & their houses
Essentials: /bin, /sbin, /lib → daily tools
Extra apps: /opt, /snap → optional shops
Config: /etc → control center
Live info: /proc, /sys, /run → dashboards
Temp & logs: /tmp, /var → workspace / scratchpad
Mounts: /mnt, /media → parking / USB
Programs & shared data: /usr → office building / librarie