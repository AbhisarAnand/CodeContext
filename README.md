# CodeContext

This shell script explores a specified project directory and gathers all the code from relevant files into a single text file called `code_context.txt` or copies it directly to the clipboard. The script supports multiple programming languages by allowing the user to specify the language, and it automatically determines the appropriate file extensions to include.

## Usage

To use this script, follow the instructions below.

### Prerequisites

- Ensure you have a Unix-like operating system with `bash` installed.
- Make sure you have the necessary permissions to execute the script and read files in the specified directory.

### Setup

1. Save the script to a file, e.g., `CodeContext.sh`.
2. Make the script executable:
    ```sh
    chmod +x CodeContext.sh
    ```

### Running the Script

The script takes three arguments:
1. The project directory to explore.
2. The programming language of the project.
3. (Optional) The output mode: `text` or `clipboard`.

- **`text`**: Outputs the code context to `code_context.txt`.
- **`clipboard`** (default): Copies the code context directly to the clipboard.

If the project directory is not specified, the script will use the current directory. The supported languages and their corresponding file extensions are:

- **python**: `*.py,*.txt,*.md`
- **flutter**: `*.dart,*.yaml,*.txt,*.md`
- **javascript**: `*.js,*.jsx,*.json,*.html,*.css,*.txt,*.md`
- **java**: `*.java,*.xml,*.txt,*.md`
- **html**: `*.html,*.css,*.js,*.txt,*.md,*.json`
- **css**: `*.css,*.html,*.js,*.txt,*.md`
- **c**: `*.c,*.h,*.txt,*.md`
- **cpp**: `*.cpp,*.h,*.txt,*.md`

#### Example Commands

- Gather code from the current directory for a Python project and copy to clipboard:
    ```sh
    ./CodeContext.sh . python
    ```
- Gather code from a specific directory for a Flutter project and output to a text file:
    ```sh
    ./CodeContext.sh /path/to/your/flutter/project flutter text
    ```
- Gather code and explicitly copy to clipboard:
    ```sh
    ./CodeContext.sh /path/to/project javascript clipboard
    ```

### Output

The output will be either:
- A file named `code_context.txt` in the same directory where the script is executed (if `text` mode is used).
- Directly copied to the clipboard (if `clipboard` mode is used).

#### Example Directory Structure

Assume the following directory structure for a Python project:
```
project/
├── main.py
├── module/
│   ├── __init__.py
│   └── utils.py
├── README.md
└── requirements.txt
```

#### Example File Contents

- `main.py`:
    ```python
    print("Hello, World!")
    ```
- `module/utils.py`:
    ```python
    def add(a, b):
        return a + b
    ```
- `README.md`:
    ```markdown
    # Project Title
    This is a sample project.
    ```
- `requirements.txt`
    ```
    requests
    numpy
    ```

#### Resulting `code_context.txt`

If outputted to a file, the `code_context.txt` will look like this:
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

If using the `clipboard` mode, the same content will be available in your clipboard, ready to paste anywhere.

