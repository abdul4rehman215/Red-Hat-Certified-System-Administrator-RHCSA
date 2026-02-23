# 🛠️ Troubleshooting Guide — Lab 29: Managing Logical Volumes (LVM)

---

# 🔎 Issue 1: "Device Busy" Error

## ❗ Error Example
```

Device or resource busy

````

## 🔍 Cause
- Device is mounted
- LVM metadata in use
- Process holding device open

## 🛠 Diagnosis

Check open files:
```bash
lsof /dev/sdb
````

Check processes using device:

```bash
fuser -v /dev/sdb
```

Example Output:

```
                     USER        PID ACCESS COMMAND
/dev/sdb:             root      1092 F....  lvm
```

## ✅ Resolution

Unmount if mounted:

```bash
umount /dev/sdb1
```

Kill blocking process:

```bash
fuser -k /dev/sdb
```

---

# 📉 Issue 2: Insufficient Space in Volume Group

## ❗ Error Example

```
Insufficient free space: X extents needed, but only Y available
```

## 🔍 Check Available Space

```bash
vgs
```

Or:

```bash
vgdisplay vg_data | grep -E "(VG Size|Free)"
```

Example:

```
VG Size               <59.99 GiB
Free  PE / Size       1277 / <4.99 GiB
```

## ✅ Solution: Add New Disk

```bash
pvcreate /dev/sde
vgextend vg_data /dev/sde
```

Verify:

```bash
vgs
```

---

# 📁 Issue 3: Filesystem Not Growing After lvextend

## ❗ Symptom

Logical volume increases, but `df -h` shows old size.

## 🔍 Cause

Filesystem was not resized.

## ✅ Fix

For ext4:

```bash
resize2fs /dev/vg_data/lv_web
```

For XFS:

```bash
xfs_growfs /mnt/database
```

---

# 📦 Issue 4: Snapshot Mount Fails

## ❗ Error

```
wrong fs type, bad superblock
```

## 🔍 Cause

Auto-detection failed.

## ✅ Mount Explicitly Read-Only

```bash
mount -t ext4 -o ro /dev/vg_data/lv_web_snapshot /mnt/web_snapshot
```

---

# 🧱 Issue 5: LVM Commands Not Found

## ❗ Error

```
pvcreate: command not found
```

## ✅ Install LVM Tools

For RHEL 8/9:

```bash
dnf install lvm2 -y
```

Verify:

```bash
rpm -q lvm2
```

Start monitoring service:

```bash
systemctl start lvm2-monitor
systemctl enable lvm2-monitor
```

---

# 🔄 Issue 6: Volume Group Not Found

## ❗ Error

```
Volume group "vg_data" not found
```

## 🔍 Rescan LVM Devices

```bash
pvscan
vgscan
lvscan
```

If inactive:

```bash
vgchange -ay vg_data
```

---

# 📌 Issue 7: Mount Fails After Reboot

## ❗ Symptom

Logical volume not mounted automatically.

## 🔍 Check /etc/fstab

```bash
cat /etc/fstab
```

Correct format:

```
/dev/vg_data/lv_web /mnt/web ext4 defaults 0 2
```

## ✅ Test Before Reboot

```bash
mount -a
```

If errors appear, fix before rebooting.

---

# 🔍 Issue 8: Physical Volume Already in Volume Group

## ❗ Error

```
Device /dev/sdb excluded by a filter
```

or

```
Physical volume belongs to a different VG
```

## ✅ Fix

Check:

```bash
pvs
```

If safe to wipe:

```bash
pvremove /dev/sdb
pvcreate /dev/sdb
```

⚠️ Warning: This destroys LVM metadata.

---

# 🧪 Issue 9: Snapshot Running Out of Space

## ❗ Symptom

Snapshot becomes invalid.

## 🔍 Check Usage

```bash
lvs -o +origin,snap_percent
```

If Snap% approaches 100%:

* Snapshot becomes unusable.

## ✅ Solution

* Create larger snapshot
* Remove and recreate snapshot

---

# 🛑 Issue 10: XFS Shrinking Attempt

## ❗ Error

XFS cannot be shrunk.

## ❗ Important

* XFS supports expansion only.
* ext4 can shrink (offline only).

Always plan filesystem type based on expected resizing needs.

---

# 🧠 Best Practices to Avoid Problems

* Always check free space before extending.
* Backup before shrinking.
* Test `/etc/fstab` with `mount -a`.
* Use `-r` flag in lvextend when possible.
* Monitor snapshot usage.
* Label volume groups clearly (e.g., vg_data, vg_backup).

---

# 📋 Quick Diagnostic Checklist

| Check            | Command                |
| ---------------- | ---------------------- |
| PV status        | `pvs`                  |
| VG status        | `vgs`                  |
| LV status        | `lvs`                  |
| Filesystem usage | `df -h`                |
| Mount points     | `mount`                |
| Snapshot usage   | `lvs -o +snap_percent` |
| Device in use    | `lsof /dev/sdX`        |

---

# 🎯 Final Note

Most LVM issues fall into:

* Not enough free space
* Filesystem not resized
* Incorrect mount configuration
* Snapshot mismanagement

Understanding PV → VG → LV → Filesystem relationships
is the key to troubleshooting efficiently.

---
