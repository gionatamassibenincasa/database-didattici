#!/usr/bin/env bash
SCRIPT=daSqliteAdocumentazione.js
DB=chinook-it.sqlite
OUTPUT=chinook-it
declare -a FORMATO=("adoc" "mermaid" "md")

for FMT in "${FORMATO[@]}"; do
  node ${SCRIPT} --db ${DB} --formato ${FMT} -o ${OUTPUT}.${FMT}
done



