Here Documents - RHCSA Notes
What Is a Here Document?

A way to feed multi-line input to a command directly from a script or terminal.
Basic Syntax
bash

command << DELIMITER
line 1
line 2
line 3
DELIMITER

Simple Example
bash

cat << EOF
Hello World
This is line 2
EOF

Why "EOF"?

EOF = End Of File (just a convention)

You can use ANY word as delimiter:
bash

cat << END      # Works
cat << STOP     # Works
cat << MARKER   # Works
cat << CAT      # Works

Quoted vs Unquoted Delimiters
Unquoted (Variables Expand)
bash

NAME="John"
cat << EOF
Hello $NAME
Today is $(date)
EOF
# Output:
# Hello John
# Today is Mon Apr 5 10:00:00 EDT 2026

Quoted (Literal Text - No Expansion)
bash

NAME="John"
cat << 'EOF'
Hello $NAME
Today is $(date)
EOF
# Output:
# Hello $NAME
# Today is $(date)

Creating Files with Here Documents
bash

# Create a configuration file
cat > config.txt << EOF
server=192.168.1.1
port=8080
user=admin
EOF

# Append to existing file
cat >> config.txt << EOF
new_setting=value
EOF

Real RHCSA Examples
Example 1: Create Systemd Service
bash

cat > /etc/systemd/system/myapp.service << 'EOF'
[Unit]
Description=My Custom Application
After=network.target

[Service]
Type=simple
User=appuser
ExecStart=/usr/local/bin/myapp

[Install]
WantedBy=multi-user.target
EOF

Example 2: Create Apache Virtual Host
bash

cat > /etc/httpd/conf.d/mysite.conf << EOF
<VirtualHost *:80>
    ServerName mysite.com
    DocumentRoot /var/www/mysite
    ErrorLog /var/log/httpd/mysite_error.log
</VirtualHost>
EOF

Example 3: Multi-line Script Creation
bash

cat > backup.sh << 'EOF'
#!/bin/bash
DATE=$(date +%Y%m%d)
tar -czf backup_$DATE.tar.gz /home/user/data
echo "Backup completed: backup_$DATE.tar.gz"
EOF
chmod +x backup.sh

Important Rules

    Closing delimiter must be ALONE on its own line

    No spaces before or after delimiter

    Case-sensitive (EOF and eof are different)

Wrong vs Correct
bash

# WRONG - space before delimiter
cat << EOF
content
 EOF

# WRONG - space after delimiter
cat << EOF
content
EOF 

# WRONG - extra text on delimiter line
cat << EOF
content
EOF extra

# CORRECT
cat << EOF
content
EOF
