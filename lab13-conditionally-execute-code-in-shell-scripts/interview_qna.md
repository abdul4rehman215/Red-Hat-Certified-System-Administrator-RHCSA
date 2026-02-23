# 🎤 Interview Q&A - Lab 13: Conditionally Execute Code in Shell Scripts

---

### 1️⃣ What is conditional execution in shell scripting?

Conditional execution allows a script to make decisions based on evaluated conditions.  
Using `if`, `elif`, and `else`, a script can execute different code blocks depending on input, file state, or computed values.

---

### 2️⃣ What is the basic syntax of an if statement in Bash?

```
if [ condition ]; then
    commands
fi
```

For multiple branches:

```
if [ condition ]; then
    commands
elif [ condition ]; then
    commands
else
    commands
fi
```

---

### 3️⃣ What are common numeric comparison operators in Bash?

- `-eq` → Equal  
- `-ne` → Not equal  
- `-gt` → Greater than  
- `-lt` → Less than  
- `-ge` → Greater than or equal  
- `-le` → Less than or equal  

These are used inside `[ ]` or `test`.

---

### 4️⃣ How do you compare strings in Bash?

```
if [ "$var" = "value" ]; then
```

Important best practice:  
Always quote variables to avoid errors when the variable is empty.

---

### 5️⃣ What is the purpose of `-f` in conditionals?

`-f` checks whether a regular file exists.

Example:

```
if [ -f "/etc/passwd" ]; then
```

Other useful file checks:

- `-d` → directory exists  
- `-r` → readable  
- `-w` → writable  
- `-x` → executable  

---

### 6️⃣ What is the difference between `test` and `[ ]`?

`[ ]` is essentially a more readable form of the `test` command.

These two are equivalent:

```
test $num -lt 5
```

```
[ $num -lt 5 ]
```

`[ ]` is preferred for readability and industry practice.

---

### 7️⃣ Why is spacing important in conditional expressions?

Incorrect:

```
if [$num -eq 5]; then
```

Correct:

```
if [ $num -eq 5 ]; then
```

Spaces are required after `[` and before `]`.

---

### 8️⃣ What is a common cause of the error “unary operator expected”?

It occurs when a variable is empty and not quoted:

Incorrect:

```
if [ $var = "yes" ]
```

Correct:

```
if [ "$var" = "yes" ]
```

Quoting prevents syntax errors.

---

### 9️⃣ Why are conditionals important in automation?

Conditionals allow scripts to:

- Validate user input
- Prevent unsafe operations
- Execute logic based on thresholds
- Adapt to system state
- Handle error scenarios gracefully

Without conditionals, automation would be static and unreliable.

---

### 🔟 Where are conditionals used in real-world Linux environments?

- Deployment validation scripts
- Backup verification logic
- Health check automation
- Log monitoring alerts
- Security policy enforcement
- CI/CD pipeline branching logic
- Container startup validation scripts

Conditionals transform simple scripts into intelligent automation systems.

---

## ✅ Interview Readiness Summary

This lab demonstrates:

- Multi-branch decision logic
- Numeric and string comparisons
- File validation checks
- Safe conditional syntax practices
- Practical automation logic skills
