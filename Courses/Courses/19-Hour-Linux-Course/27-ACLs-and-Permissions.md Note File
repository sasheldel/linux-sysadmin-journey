# Access Control Lists (ACLs) & File Permissions
**Course:** 19-Hour Linux Mastery  
**Topic:** ACLs & Standard File Permissions  
**Timecode Reference:**  
- Part 27–28: ACLs pt.1 & pt.2 (04:00:00 – 04:11:22)

---

## ✅ What I Learned

- **Standard file permissions** use user/group/other and `rwx` model.
- **ACLs** provide *more granular* control beyond the owner/group/other model.
- You can give **specific users** access without changing ownership or group.

---

## 🔧 Commands Practiced

```bash
# 1. Create file and user
sudo touch report.txt
sudo useradd alex

# 2. Set ACL to give alex read and execute permission
sudo setfacl -m u:alex:rx report.txt

# 3. Verify ACL
getfacl report.txt
 Access Control Lists (ACLs)
	•	ACLs offer more flexible permissions.
	•	You can assign specific permissions to multiple users or groups beyond owner/group/others.
	•	Checked with: getfacl filename
🧪 Hands-On Practice

🎯 Goal: Create a file and allow a second user to read it using ACL.
# Create a user
sudo useradd alex

# Create a file
touch important.txt

# Set ACL permissions
sudo setfacl -m u:alex:rx important.txt

# Verify ACL permissions
getfacl important.txt
🤔 Reflection: What I’m Still Working Through
	•	When should I use ACL vs standard permissions?
	•	How do default ACLs apply to new files in a directory?
	•	Do ACLs work with backups and rsync out of the box?
💼 Real-World Use Cases
	•	ACLs are useful in shared project environments.
	•	Helps system admins grant access without changing group ownership.
	•	Supports fine-grained control in team-based workflows (e.g., /srv/projects/).

⸻
🛠️ Next Action Steps
	•	Practice setting default ACLs on directories: setfacl -d -m u:alex:rx /path/to/dir

⸻

🔗 Resources
	•	man setfacl
	•	man getfacl
	•	ACL Guide on Linuxize
	•	Practice on test files inside /home/test-acl/

