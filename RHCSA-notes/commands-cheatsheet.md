cat > commands-cheatsheet.md << 'EOF'
# RHCSA Commands Cheatsheet

## Essential Commands

| Command | Purpose |
|---------|---------|
| `ls` | List files |
| `cd` | Change directory |
| `pwd` | Print working directory |
| `cp` | Copy files |
| `mv` | Move/rename |
| `rm` | Remove files |
| `mkdir` | Create directory |
| `cat` | Concatenate files |
| `less` | View file page by page |
| `head/tail` | First/last lines |
| `grep` | Search text |
| `find` | Find files |
| `wc` | Count lines/words |
| `sort` | Sort lines |
| `uniq` | Remove duplicates |

## Redirection Operators

| Operator | Purpose |
|----------|---------|
| `>` | stdout to file (overwrite) |
| `>>` | stdout to file (append) |
| `2>` | stderr to file |
| `2>>` | stderr to file (append) |
| `&>` | stdout+stderr to file |
| `\|` | Pipe |
| `<` | stdin from file |
| `<< EOF` | Here document |

## Wildcards

| Pattern | Matches |
|---------|---------|
| `*` | Anything |
| `?` | One character |
| `[a-z]` | Range |
| `[[:upper:]]` | Uppercase |

## Grep Options

| Option | Meaning |
|--------|---------|
| `-i` | Ignore case |
| `-l` | List filenames only |
| `-v` | Invert match |
| `-w` | Whole word |
| `-c` | Count matches |
| `-n` | Show line numbers |
| `-r` | Recursive |

## Man Page Sections

| Section | Content |
|---------|---------|
| 1 | User commands |
| 5 | File formats |
| 8 | Admin commands |

```bash
# Example
man 5 crontab   # crontab file format
man 8 semanage  # SELinux management

 Commit
git commit -m "Complete reorganization of RHCSA notes

- Add 00-index.md as master navigation
- Rename 01-man-pages-bootcamp.md (from man-pages-reference.md)
- Renumber 02-io-redirection.md
- Expand 03-grep-text-processing.md with full content
- Add 04-pipes-filters.md
- Add 05-pathname-expansion.md
- Add 06-here-documents.md
- Add commands-cheatsheet.md"

# Push to GitHub
git push origin main
