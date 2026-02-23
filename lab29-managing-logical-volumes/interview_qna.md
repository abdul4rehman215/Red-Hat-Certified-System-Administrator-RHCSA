# 🎤 Interview Q&A — Lab 29: Logical Volume Management (LVM)

---

## 1️⃣ What is LVM and why is it used?

**Logical Volume Management (LVM)** is a storage abstraction layer that allows flexible disk management.

Instead of using fixed partitions, LVM allows:
- Dynamic resizing
- Pooling multiple disks together
- Creating snapshots
- Extending storage without downtime

---

## 2️⃣ What are the main LVM components?

| Component | Description |
|------------|------------|
| **PV (Physical Volume)** | Raw disk or partition initialized for LVM |
| **VG (Volume Group)** | Storage pool created from one or more PVs |
| **LV (Logical Volume)** | Virtual partition created inside a VG |
| **PE (Physical Extent)** | Smallest allocation unit in LVM (default 4MB) |

Flow:
```

Disk → PV → VG → LV → Filesystem → Mount

````

---

## 3️⃣ What command initializes a disk for LVM?

```bash
pvcreate /dev/sdb
````

This converts a raw disk into an LVM Physical Volume.

---

## 4️⃣ How do you create a Volume Group?

```bash
vgcreate vg_data /dev/sdb /dev/sdc
```

This creates a storage pool combining multiple physical volumes.

---

## 5️⃣ How do you create a Logical Volume?

By size:

```bash
lvcreate -L 10G -n lv_web vg_data
```

By percentage:

```bash
lvcreate -l 50%VG -n lv_logs vg_data
```

---

## 6️⃣ How do you extend a Logical Volume?

```bash
lvextend -L +5G /dev/vg_data/lv_web
```

This increases LV size but **does not resize the filesystem automatically**.

---

## 7️⃣ How do you resize filesystems after LV extension?

For **ext4**:

```bash
resize2fs /dev/vg_data/lv_web
```

For **XFS**:

```bash
xfs_growfs /mnt/database
```

---

## 8️⃣ What is the difference between ext4 and XFS resizing?

| Feature       | ext4      | XFS           |
| ------------- | --------- | ------------- |
| Online resize | Yes       | Yes           |
| Command       | resize2fs | xfs_growfs    |
| Shrinking     | Possible  | Not supported |

---

## 9️⃣ What does the `-r` flag do in lvextend?

```bash
lvextend -L +2G -r /dev/vg_data/lv_logs
```

It automatically resizes the filesystem after extending the logical volume.

---

## 🔟 What is an LVM Snapshot?

A snapshot is a **point-in-time copy** of a logical volume.

Used for:

* Backup
* Testing
* Rollback scenarios

Create snapshot:

```bash
lvcreate -L 1G -s -n lv_web_snapshot /dev/vg_data/lv_web
```

---

## 1️⃣1️⃣ How do you check LVM status?

| Command                | Purpose               |
| ---------------------- | --------------------- |
| `pvs`                  | Show physical volumes |
| `vgs`                  | Show volume groups    |
| `lvs`                  | Show logical volumes  |
| `pvdisplay`            | Detailed PV info      |
| `vgdisplay`            | Detailed VG info      |
| `lvdisplay`            | Detailed LV info      |
| `pvscan/vgscan/lvscan` | Scan for LVM devices  |

---

## 1️⃣2️⃣ How do you make LVM mounts persistent?

Add to `/etc/fstab`:

```
/dev/vg_data/lv_web /mnt/web ext4 defaults 0 2
```

Test safely with:

```bash
mount -a
```

---

## 1️⃣3️⃣ What are the advantages of LVM?

* Flexible resizing
* Combine multiple disks
* Online expansion
* Snapshots for backup
* Better storage utilization

---

## 1️⃣4️⃣ What happens if you forget to resize the filesystem?

The logical volume grows,
but the filesystem size remains unchanged.

`df -h` will still show the old size.

---

## 1️⃣5️⃣ Real-World Use Cases

* Database servers that need live storage expansion
* Log storage that grows unpredictably
* Cloud environments where disks are added dynamically
* Backup systems using snapshot-based backups

---

## 1️⃣6️⃣ How do you troubleshoot insufficient space in a VG?

Check:

```bash
vgs
```

If no free space:

* Add new disk
* Run `pvcreate`
* Then `vgextend`

---

## 1️⃣7️⃣ Can you shrink LVM?

* LV shrinking: Possible (carefully)
* ext4: Can shrink (offline)
* XFS: Cannot shrink
* Always backup before shrinking

---

## 1️⃣8️⃣ RHCSA Exam Focus Areas for LVM

* Create PV, VG, LV
* Extend LV
* Grow filesystem
* Configure persistent mounts
* Use correct commands under time pressure

---

## 🎯 Final Takeaway

LVM provides:

* Scalability
* Flexibility
* Minimal downtime storage expansion
* Enterprise-ready disk management

Mastering LVM is critical for:

* Linux System Administration
* Cloud Infrastructure
* Production Storage Management
* RHCSA Certification

