# CodeContext

This shell script explores a specified project directory and gathers all the code from relevant files into a single text file called `code_context.txt`. The script supports multiple programming languages by allowing the user to specify the language, and it automatically determines the appropriate file extensions to include.

## Usage

To use this script, follow the instructions below.

### Prerequisites

- Ensure you have a Unix-like operating system with `bash` installed.
- Make sure you have the necessary permissions to execute the script and read files in the specified directory.

### Setup

1. Save the script to a file, e.g., `CodeContext.sh`.
2. Make the script executable:
    ```sh
    chmod +x gather_code.sh
    ```

### Running the Script

The script takes two arguments:
1. The project directory to explore.
2. The programming language of the project.

If the project directory is not specified, the script will use the current directory. The supported languages and their corresponding file extensions are:

- **python**: `*.py,*.txt,*.md`
- **flutter**: `*.dart,*.yaml,*.txt,*.md`
- **javascript**: `*.js,*.jsx,*.json,*.html,*.css,*.txt,*.md`
- **java**: `*.java,*.xml,*.txt,*.md`

#### Example Commands

- Gather code from the current directory for a Python project:
    ```sh
    ./gather_code.sh . python
    ```
- Gather code from a specific directory for a Flutter project:
    ```sh
    ./gather_code.sh /path/to/your/flutter/project flutter
    ```

### Output

The output is a file named `code_context.txt` in the same directory where the script is executed. The file contains the paths and contents of all relevant files. Here is an example:
- Example Directory Structure
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

- Example File Contents
 * `main.py`:
    ```python
    print("Hello, World!")
    ```
 * `module/utils.py`:
    ```python
    def add(a, b):
        return a + b
    ```
 * `README.md`:
    ```markdown
    # Project Title
    This is a sample project.
    ```
 * `requirements.txt`
    ```
    requests
    numpy
    ```
- Resulting `code_context.txt`
The code_context.txt file will look like this:
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
