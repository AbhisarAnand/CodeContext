#!/bin/bash

get_file_extensions() {
    case "$1" in
        python)
            echo "*.py,*.txt,*.md"
            ;;
        flutter)
            echo "*.dart,*.yaml,*.txt,*.md"
            ;;
        javascript)
            echo "*.js,*.jsx,*.json,*.html,*.css,*.txt,*.md"
            ;;
        java)
            echo "*.java,*.xml,*.txt,*.md"
            ;;
        html)
            echo "*.html,*.css,*.js,*.txt,*.md"
            ;;
        css)
            echo "*.css,*.html,*.js,*.txt,*.md"
            ;;
        c)
            echo "*.c,*.h,*.txt,*.md"
            ;;
        cpp)
            echo "*.cpp,*.h,*.txt,*.md"
            ;;
        *)
            echo ""
            ;;
    esac
}

if [ -z "$1" ]; then
    PROJECT_DIR="."
else
    PROJECT_DIR="$1"
fi

if [ -z "$2" ]; then
    echo "Usage: $0 <project_directory> <language>"
    exit 1
fi

LANGUAGE="$2"

FILE_EXTENSIONS=$(get_file_extensions "$LANGUAGE")

if [ -z "$FILE_EXTENSIONS" ]; then
    echo "Unsupported language: $LANGUAGE"
    exit 1
fi

OUTPUT_FILE="code_context.txt"

rm -f "$OUTPUT_FILE"

IFS=',' read -r -a extensions_array <<< "$FILE_EXTENSIONS"

find_args=()

for ext in "${extensions_array[@]}"; do
    find_args+=("-name" "$ext" "-o")
done

unset 'find_args[${#find_args[@]}-1]'

find_command=("find" "$PROJECT_DIR" "-type" "f" "(" "${find_args[@]}" ")")

"${find_command[@]}" | while read -r file; do
    echo "### $file ###" >> "$OUTPUT_FILE"
    cat "$file" >> "$OUTPUT_FILE"
    echo -e "\n" >> "$OUTPUT_FILE"
done

echo "Code context has been gathered in $OUTPUT_FILE"
