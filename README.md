# CodeContext

CodeContext is a shell script that scans a project directory and collects all relevant code files into a single output (`code_context.txt`) or copies them directly to your clipboard. It supports various programming languages and automatically filters files based on language-specific extensions.

---

## 🚀 Installation

To make `CodeContext` accessible from anywhere, use the included `install.sh` script.

### Steps:

1. Clone or download this repository.
2. Make the installer executable:
   ```sh
   chmod +x install.sh
   ```
3. Run the installer:
   ```sh
   ./install.sh
   ```
   This will:
   - Make the `CodeContext.sh` script executable.
   - Copy it to `/usr/local/bin/CodeContext`.

> If `/usr/local/bin` requires root permission:
> ```sh
> sudo ./install.sh
> ```

You can now run `CodeContext` as a command globally.

---

## 🧠 Usage

```sh
CodeContext <project_directory> <language> [output_mode: text|clipboard]
```

- `<project_directory>` – The directory to scan (defaults to current `.` if not specified).
- `<language>` – Programming language to filter relevant files.
- `[output_mode]` – Optional: `text` or `clipboard` (default is `clipboard`).

---

## 🗂 Supported Languages

| Language    | File Extensions |
|-------------|-----------------|
| python      | `.py`, `.txt`, `.md`, `.html`, `Dockerfile` |
| flutter     | `.dart`, `.yaml`, `.txt`, `.md` |
| javascript  | `.js`, `.jsx`, `.json`, `.html`, `.css`, `.txt`, `.md` |
| meteor      | `.js`, `.jsx`, `.ts`, `.tsx`, `.json`, `.html`, `.css`, `.md`, `.txt`, `.yaml`, `.yml`, `.sh`, `.bash`, `.meteor`, `.eslintrc`, `.prettierrc`, `.babelrc`, `.eslintignore`, `.prettierignore` |
| java        | `.java`, `.xml`, `.txt`, `.md` |
| html        | `.html`, `.css`, `.js`, `.txt`, `.md`, `.json` |
| css         | `.css`, `.html`, `.js`, `.txt`, `.md` |
| c           | `.c`, `.h`, `.txt`, `.md` |
| cpp         | `.cpp`, `.h`, `.txt`, `.md` |

---

## 📌 Examples

- Copy Python project code from the current directory to clipboard:
  ```sh
  CodeContext . python
  ```

- Save code context from a Flutter project to a file:
  ```sh
  CodeContext /path/to/project flutter text
  ```

- Copy JavaScript project code from any directory:
  ```sh
  CodeContext /some/project javascript clipboard
  ```

---

## 📤 Output

Depending on the mode:

- **text** → Creates `code_context.txt` in the working directory.
- **clipboard** → Copies the result directly using `pbcopy` (macOS).

---

## 🧾 Sample Project Structure

```
my-python-project/
├── main.py
├── module/
│   ├── __init__.py
│   └── utils.py
├── README.md
└── requirements.txt
```

**Sample Output (code_context.txt):**
```
### ./main.py ###
print("Hello, World!")

### ./module/__init__.py ###

### ./module/utils.py ###
def add(a, b):
    return a + b

### ./README.md ###
# Project Title
This is a sample project.

### ./requirements.txt ###
requests
numpy
```

If using clipboard mode, this will be placed in your system clipboard, ready to paste.

---
