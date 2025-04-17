#!/bin/bash

get_file_extensions() {
    case "$1" in
        python)
            echo "*.py,*.txt,*.md,*.html,Dockerfile"
            ;;
        flutter)
            echo "*.dart,*.yaml,*.txt,*.md"
            ;;
        javascript)
            echo "*.js,*.jsx,*.json,*.html,*.css,*.txt,*.md"
            ;;
        meteor)
            echo "*.js,*.jsx,*.ts,*.tsx,*.json,*.html,*.css,*.md,*.txt,*.yaml,*.yml,*.sh,*.bash,.meteor,.eslintrc,.prettierrc,.babelrc,.eslintignore,.prettierignore"
            ;;
        java)
            echo "*.java,*.xml,*.txt,*.md"
            ;;
        html)
            echo "*.html,*.css,*.js,*.txt,*.md,*.json"
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
    echo "Usage: $0 <project_directory> <language> [output_mode: text|clipboard]"
    exit 1
fi

LANGUAGE="$2"
OUTPUT_MODE="${3:-clipboard}"

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

TEMP_FILE=$(mktemp)

"${find_command[@]}" | while read -r file; do
    echo "### $file ###" >> "$TEMP_FILE"
    cat "$file" >> "$TEMP_FILE"
    echo -e "\n" >> "$TEMP_FILE"
done

if [ "$OUTPUT_MODE" = "text" ]; then
    mv "$TEMP_FILE" "$OUTPUT_FILE"
    echo "Code context has been gathered in $OUTPUT_FILE"
else
    if command -v pbcopy &> /dev/null; then
        cat "$TEMP_FILE" | pbcopy
        echo "Code context has been copied to the clipboard."
    else
        echo "Clipboard functionality (pbcopy) is not available. Outputting to $OUTPUT_FILE instead."
        mv "$TEMP_FILE" "$OUTPUT_FILE"
    fi
fi

rm -f "$TEMP_FILE"

