# 🎤 Interview Q&A - Lab 14: Using Loops in Shell Scripts

---

### 1️⃣ What is a loop in shell scripting?

A loop is a control structure that allows repetitive execution of commands until a specified condition is met.  
Loops help automate repetitive tasks efficiently.

---

### 2️⃣ What are the main types of loops in Bash?

- `for` loop → Iterates over a list of items
- `while` loop → Runs while a condition is true
- `until` loop → Runs until a condition becomes true

Each serves different automation scenarios.

---

### 3️⃣ When should you use a for loop?

Use a `for` loop when:

- Iterating over files
- Processing lists
- Handling command-line arguments
- Working with arrays
- Running fixed iteration sequences

Example:

```
for file in *.txt; do
    echo $file
done
```

---

### 4️⃣ What is the difference between while and until loops?

- `while` executes **while condition is true**
- `until` executes **until condition becomes true**

Example:

```
while [ $count -le 5 ]
```

```
until [ $count -eq 0 ]
```

`until` is essentially the reverse logic of `while`.

---

### 5️⃣ What is arithmetic expansion in Bash?

Arithmetic expansion allows numeric operations inside scripts:

```
((count++))
```

It simplifies increment and decrement operations.

---

### 6️⃣ What is the purpose of break in a loop?

`break` immediately exits the loop.

Used when:

- A condition is met
- Desired result is found
- Further iteration is unnecessary

It improves performance and control flow.

---

### 7️⃣ What does continue do in a loop?

`continue` skips the current iteration and proceeds to the next cycle of the loop.

Example use case:

- Skip invalid entries
- Ignore specific values during processing

---

### 8️⃣ How do loops improve automation?

Loops allow:

- Batch processing of files
- Automated backups
- Log analysis
- Iterating through servers
- Monitoring multiple services
- Scaling operations without manual repetition

---

### 9️⃣ What happens if a loop condition never becomes false?

The loop becomes infinite.

Example:

```
while true; do
    echo "Running..."
done
```

To stop:

- Press `Ctrl + C`
- Use `break` inside logic

---

### 🔟 Where are loops used in real-world Linux environments?

Loops are used in:

- Deployment automation
- Log parsing scripts
- Container orchestration tasks
- User account management
- Service health checks
- File integrity monitoring
- CI/CD pipeline scripting

Loops are foundational for scalable infrastructure automation.

---

## ✅ Interview Readiness Summary

This lab demonstrates:

- Mastery of loop constructs
- Iteration across files and sequences
- Arithmetic operations in scripts
- Execution control using break
- Combining loops with conditionals
