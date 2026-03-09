#!/bin/bash
# Generate Architecture Tests from ADR Rules
# This script regenerates all architecture tests from the .rule files

set -e

echo "Generating architecture tests from ADR rules..."

# Define rule IDs to process
rule_ids=("0004" "0005" "0006" "0009" "0010" "0014" "0015" "0016" "0017")

# Generate tests for each rule
count=0
for rule_id in "${rule_ids[@]}"; do
    rule_path="./docs/architecture-decision-log/${rule_id}.rule"
    
    if [ -f "$rule_path" ]; then
        echo "  + Processing ADR $rule_id..."
        ./ade.exe compile -i "$rule_path" -o ./rules -p csharp
        
        if [ $? -eq 0 ]; then
            ((count++))
        else
            echo "  X Failed to process ADR $rule_id"
            exit 1
        fi
    else
        echo "  ! Rule file not found: $rule_path"
    fi
done

echo ""
echo "Copying generated tests to ArchTests project..."

# Ensure destination directory exists
dest_dir="src/Tests/ArchTests/Generated"
mkdir -p "$dest_dir"

# Copy generated files
cp rules/*.g.cs "$dest_dir/" 2>/dev/null || true

copied_files=$(ls -1 "$dest_dir"/*.g.cs 2>/dev/null | wc -l)

echo ""
echo "[OK] Successfully generated $count test files"
echo "[OK] Copied $copied_files files to $dest_dir"
echo ""
echo "You can now run the tests with:"
echo "  dotnet test src/Tests/ArchTests/CompanyName.MyMeetings.ArchTests.csproj"
