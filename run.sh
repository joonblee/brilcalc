#!/bin/sh
# Set `source /cvmfs/cms-bril.cern.ch/cms-lumi-pog/brilws-docker/brilws-env` before run this code.

trig_JetHT_2016="
 HLT_PFJet40_v*
 HLT_PFJet60_v*
 HLT_PFJet80_v*
 HLT_PFJet140_v*
 HLT_PFJet200_v*
 HLT_PFJet260_v*
 HLT_PFJet320_v*
 HLT_PFJet400_v*
 HLT_PFJet450_v*
 HLT_PFJet500_v*
 HLT_PFJet900_v*
"

for path in $trig_JetHT_2016
do
 brilcalc lumi --normtag /cvmfs/cms-bril.cern.ch/cms-lumi-pog/Normtags/normtag_PHYSICS.json -u /fb -i Cert_271036-284044_13TeV_Legacy2016_Collisions16_JSON.txt --hltpath "$path" -o $path.csv
 echo $path.csv is created
done

find . -type f -name '*\**' | while IFS= read -r file; do
  newfile=$(echo "$file" | tr -d '*')
  mv "$file" "$newfile"
done

echo " + All done +"
