#!/usr/bin/env bash
# =============================================================================
# Validate all ESPHome device configs before commit
# =============================================================================
set -euo pipefail

echo "ESPHome Config Validation"
echo "========================="
echo

# Find all device YAML files (exclude templates, test files, workflows)
CONFIGS=$(find . -maxdepth 1 -name "*.yaml" -type f | sort)

if [ -z "$CONFIGS" ]; then
  echo "No device configs found!"
  exit 1
fi

FAILED=0
PASSED=0

for config in $CONFIGS; do
  device=$(basename "$config")
  echo -n "Validating $device ... "
  
  if esphome config "$config" > /dev/null 2>&1; then
    echo "✓ PASS"
    ((PASSED++))
  else
    echo "✗ FAIL"
    echo "  Run 'esphome config $config' to see errors"
    ((FAILED++))
  fi
done

echo
echo "========================="
echo "Results: $PASSED passed, $FAILED failed"

if [ $FAILED -gt 0 ]; then
  echo
  echo "❌ Validation failed. Fix errors before committing."
  exit 1
fi

echo "✅ All configs valid!"
exit 0
