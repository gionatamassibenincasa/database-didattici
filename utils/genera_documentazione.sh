#!/usr/bin/env bash
SCRIPT=../utils/daSqliteAdocumentazione.js
OUTPUT=$1
DB=${OUTPUT}.sqlite
declare -a FORMATO=("adoc" "mermaid" "md")

for FMT in "${FORMATO[@]}"; do
  node ${SCRIPT} --db ${DB} --formato ${FMT} -o doc/${OUTPUT}.${FMT}
done
node ${SCRIPT} --db ${DB} --formato mermaid --diagramma ER -o doc/${OUTPUT}-er.${FMT}

