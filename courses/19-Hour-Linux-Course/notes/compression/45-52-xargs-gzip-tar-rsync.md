# 🧠 Linux Admin Journey Notes: xargs, gzip, tar, bzip2, zip, rsync (Lessons 45–52)
> 📚 From: 19-Hour Linux Course | GitHub Repo: `linux-sysadmin-journey`

---

## ✅ Lesson 45 – `xargs`

### 🔹 What it does:
- Takes input from `stdin` and **builds command arguments** from it
- Super useful with commands like `find`, `grep`, and `ls`

### 🔸 Examples:
```bash
# Delete all .log files found
find . -name "*.log" | xargs rm

# Count lines in all .txt files
ls *.txt | xargs wc -l

find . -name "*.txt" -print0 | xargs -0 rm


✅ Lesson 46 – gzip

🔹 What it does:
	•	Compresses a single file
	•	Adds .gz extension

🔸 Commands:
gzip filename.txt         # Creates filename.txt.gz
gunzip filename.txt.gz    # Decompress


✅ Lessons 47–48 – tar pt.1 & pt.2

🔹 What it does:
	•	Archives multiple files into one file
	•	Often combined with compression

🔸 Commands:# Create a tar archive
tar -cvf archive.tar file1 file2

# Create a compressed archive
tar -czvf archive.tar.gz dir/

# Extract
tar -xvf archive.tar
tar -xzvf archive.tar.gz

✅ Lesson 49 – bzip2, xz, .tar.bz2, .tar.xz

🔸 bzip2 – Better compression than gzip
bzip2 file.txt         # → file.txt.bz2
bunzip2 file.txt.bz2

xz file.txt            # → file.txt.xz
unxz file.txt.xz



