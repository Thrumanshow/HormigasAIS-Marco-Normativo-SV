#!/usr/bin/env bash
# Snapshot de evidencias técnicas observables (solo lectura, sin credenciales)
set -u
mkdir -p evidencias
OUT="evidencias/snapshot-$(date -u +%Y%m%d-%H%M).md"
T=$(mktemp)

{
echo "# Snapshot de evidencias técnicas"
echo
echo "Fecha (UTC): $(date -u +%Y-%m-%dT%H:%M:%SZ)"
echo
echo "> Estado técnico observable. No constituye una declaración de cumplimiento legal."
echo
echo "## Disponibilidad de enlaces"
echo
echo "| Enlace | HTTP |"
echo "|---|---|"
for u in \
  https://hormigasais.com \
  https://docs.hormigasais.com/legal.html \
  https://docs.hormigasais.com/institucionalidad.html \
  https://docs.hormigasais.com/MANIFESTO_LEGAL_SOBERANO.pdf \
  https://hormigasais.com/CV_CLHQ_TECH_ATS_1PAGE.txt \
  https://pypi.org/project/lbh-sdk/ \
  https://doi.org/10.5281/zenodo.19177759 \
  https://github.com/Thrumanshow/HormigasAIS-Institucionalidad
do
  c=$(curl -s -o /dev/null -L -m 20 -w '%{http_code}' "$u")
  echo "| $u | $c |"
done
echo
echo "## Huellas SHA-256"
echo
code=$(curl -s -o "$T" -m 30 -w '%{http_code}' https://docs.hormigasais.com/MANIFESTO_LEGAL_SOBERANO.pdf)
if [ "$code" = "200" ]; then h=$(sha256sum "$T" | cut -c1-64); else h="no disponible (HTTP $code)"; fi
echo "- MANIFESTO_LEGAL_SOBERANO.pdf: \`$h\`"
echo
echo "## Versiones publicadas"
echo
pv=$(curl -s -m 20 https://pypi.org/pypi/lbh-sdk/json | python3 -c "import sys,json; print(json.load(sys.stdin)['info']['version'])" 2>/dev/null)
echo "- PyPI lbh-sdk: ${pv:-no disponible}"
nv=$(npm view hormigasais-edge-starter version 2>/dev/null)
echo "- npm hormigasais-edge-starter: ${nv:-no disponible}"
} > "$OUT"

rm -f "$T"
echo "Escrito: $OUT"
