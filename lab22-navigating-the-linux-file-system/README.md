# 🧭 Lab 22 – Navigating the Linux File System

## 🎯 Objectives

By the end of this lab, I was able to:

- Understand the hierarchical structure of the Linux file system
- Navigate using both **absolute** and **relative** paths
- Use file location commands: **find**, **locate**, and **which**
- Distinguish between path types and apply them correctly
- Practice filesystem navigation in realistic administration scenarios

---

## ✅ Prerequisites

Before starting this lab, the following were required:

- Basic understanding of files and folders
- Ability to type commands into a terminal
- Access to a Linux CLI environment (cloud-based)
- No advanced Linux knowledge required (beginner-friendly)

---

## 🖥️ Lab Environment

| Component | Details |
|----------|---------|
| OS | CentOS Linux 7 (Core) |
| Distribution Type | RHEL-based |
| Shell | bash 4.2 |
| User | centos |
| Environment Type | Cloud-based Linux terminal |

---


## 📁 Repository Structure

```

lab22-navigating-the-linux-file-system/
│
├── README.md
├── commands.sh
├── output.txt
├── interview_qna.md
├── troubleshooting.md
└── scripts/
└── hello.sh

```

> 📌 Note: This lab includes a simple executable script (`hello.sh`) created during Task 1.4, stored under `scripts/`.

---

## 🧭 Task Overview & Execution Summary

This lab is divided into three major tasks.

---

### ✅ Task 1 – Explore File System Paths

Performed:

- Verified current working directory and moved into `/`
- Inspected the root directory layout (`ls -la /`)
- Reviewed key directories and their purpose:
  - `/bin`, `/etc`, `/home`, `/var`
- Created a structured lab workspace under `~/lab2`
- Practiced navigation using:
  - Absolute paths (`/home/centos/...`)
  - Relative paths (`cd ..`, `cd ../..`, `cd -`, `ls .`, `ls ..`)
- Created sample files across directories for search practice

---

### 🔎 Task 2 – Locate Files Using `find`, `locate`, and `which`

Performed:

- Used `find` for real-time searching:
  - search by type, name, executable flag, size, modified time
  - executed commands on matches using `-exec`
- Searched system directories (`/etc`, `/var/log`) using redirection for permission errors
- Set up and used `locate`:
  - Discovered missing tools (`sudo`, `mlocate`)
  - Installed required packages with `yum`
  - Updated locate database and ran locate searches
  - Compared speed of `locate` vs `find` using `time`
- Used `which` and PATH operations:
  - found executable locations
  - displayed PATH
  - used `which -a` for multiple binary locations
  - added `~/lab2/scripts` to PATH and executed custom script

---

### 🧪 Task 3 – Practical Path Navigation Scenarios

Performed:

- Built a “company” directory structure:
  - `~/lab2/company/{hr,finance,it}/{reports,archives}`
  - added IT subfolders: `{servers,workstations}`
- Practiced realistic navigation scenarios using:
  - mixed absolute + relative traversal
  - deep path jumps using `..`
  - quick toggling using `cd -`
- Performed file operations using paths:
  - created and copied files between departments
  - moved files using relative paths
- Used `find` to collect `.txt` files into a central directory (`~/lab2/all_txt_files`)

---

## 📌 Key Concepts Practiced

### 🔹 Absolute Paths
- Start from `/`
- Work from any location
- Example:
  - `/home/centos/lab2/documents/report.txt`

### 🔹 Relative Paths
- Depend on current location
- Shorter and faster for navigation
- Example:
  - `../hr/reports`

### 🔹 File Location Tools
- `find` → real-time, powerful, supports complex filters
- `locate` → database-driven, extremely fast, requires `updatedb`
- `which` → shows executable location based on PATH

---

## 📊 Result

✔ Created a full test directory structure under `~/lab2`  
✔ Created sample files and executable script for testing  
✔ Successfully navigated using absolute + relative paths  
✔ Located files using `find`, `locate`, and `which`  
✔ Installed missing tools (`sudo`, `mlocate`) and updated database  
✔ Demonstrated PATH modification and custom script execution  
✔ Completed verification scenarios successfully  

---

## 🧠 What I Learned

- Linux paths are a core skill: nearly every admin task depends on navigation accuracy
- `find` is the most flexible search tool and works without a database
- `locate` is fast but depends on `updatedb` and proper package installation
- `which` helps confirm what binary will run (important for troubleshooting)
- `cd -` is extremely useful for toggling between two directories
- Permission errors are common in `/etc` and `/var/log`, and redirection helps keep output clean (`2>/dev/null`)
- PATH changes can temporarily expose custom tools/scripts for easier use

---

## 🔥 Why This Matters (RHCSA + Real World)

In RHCSA and real system administration:

- You must locate config files quickly (`/etc`)
- You must locate logs quickly (`/var/log`)
- You must understand path resolution to avoid mistakes (especially when running destructive commands)
- You must troubleshoot “command not found” issues by understanding PATH and executable locations

These skills are used repeatedly in:

- user management
- permissions + ACLs
- service configuration
- troubleshooting boot failures
- log analysis and incident response workflows

---

## 🌍 Real-World Applications

- **System Administration**: finding logs, configs, recently modified files
- **Security Operations**: locating suspicious files, scripts, binaries
- **Development Environments**: structuring project folders and navigating efficiently
- **Troubleshooting**: identifying which binary is being executed and verifying PATH

---

## 🏁 Conclusion

In this lab, I successfully:

- Explored the Linux filesystem hierarchy starting from `/`
- Practiced absolute and relative navigation in depth
- Created structured directories and test files for searching
- Used `find`, `locate`, and `which` to locate files and executables
- Installed missing tools (`sudo`, `mlocate`) and compared search performance
- Completed realistic verification tasks aligned with RHCSA expectations

✅ Lab 02 Completed Successfully  
📍 Environment: CentOS 7 (Cloud Lab)  
🎓 RHCSA Preparation Track
