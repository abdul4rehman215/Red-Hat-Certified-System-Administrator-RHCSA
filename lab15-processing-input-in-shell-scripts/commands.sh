# 💻 Lab 15 – Commands Reference  
## Processing Input in Shell Scripts

---

## 📁 Environment Verification

Check OS version:

```
cat /etc/os-release
```

---

## 🧩 Task 1 – Create Script with Positional Parameters

Create script:

```
nano input_script.sh
```

Make executable:

```
chmod +x input_script.sh
```

Run with arguments:

```
./input_script.sh apple banana cherry
```

---

## 🧩 Task 2 – Interactive Input with read

Edit script:

```
nano input_script.sh
```

Run script:

```
./input_script.sh
```

Run with positional parameter:

```
./input_script.sh /tmp
```

---

## 🧩 Task 3 – Input Validation & Error Handling

Edit script for directory validation:

```
nano input_script.sh
```

Test invalid directory:

```
./input_script.sh /invalidpath
```

Check exit code:

```
echo $?
```

---

## 🧩 Task 4 – Using set -e for Automatic Exit

Create script:

```
nano double_number.sh
```

Make executable:

```
chmod +x double_number.sh
```

Run with valid input:

```
./double_number.sh 10
```

Run with invalid input:

```
./double_number.sh abc
```

---

## 🔎 Optional Validation Commands

Check if directory exists manually:

```
ls -ld /tmp
```

Syntax check script without execution:

```
bash -n input_script.sh
```

---

## 🧹 File Permission Verification

```
ls -l *.sh
```

---

✅ All command executions validated in Ubuntu 24.04.1 LTS
