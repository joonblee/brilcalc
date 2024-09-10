# 0. Installation

Refer `https://cms-opendata-workshop.github.io/workshop-lesson-luminosity/02-installing-brilcalc/index.html` for quick start.
Detailed instruction can be found on `https://cms-service-lumi.web.cern.ch/cms-service-lumi/brilwsdoc.html`, and `https://twiki.cern.ch/twiki/bin/view/CMS/BrilcalcQuickStart`.
GoldenJSON files can be gotten from `https://twiki.cern.ch/twiki/bin/view/CMSPublic/SWGuideGoodLumiSectionsJSONFile`.
For example, Run-II golden json files are
```
2018 data: lxplus /afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions18/13TeV/Legacy_2018/Cert_314472-325175_13TeV_Legacy2018_Collisions18_JSON.txt
2017 data: lxplus /afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions17/13TeV/Legacy_2017/Cert_294927-306462_13TeV_UL2017_Collisions17_GoldenJSON.txt
2016 data: lxplus /afs/cern.ch/cms/CAF/CMSCOMM/COMM_DQM/certification/Collisions16/13TeV/Legacy_2016/Cert_271036-284044_13TeV_Legacy2016_Collisions16_JSON.txt
```
LUM POG also provides all detailed information.
If one gets any problem during following the instructions, check LUM POG, `https://twiki.cern.ch/twiki/bin/viewauth/CMS/TWikiLUM`.


# 1. Luminosity of each run

To calculate, e.g. 2016 luminosity, do
```
source /cvmfs/cms-bril.cern.ch/cms-lumi-pog/brilws-docker/brilws-env
brilcalc lumi --normtag /cvmfs/cms-bril.cern.ch/cms-lumi-pog/Normtags/normtag_PHYSICS.json -u /fb -i Cert_271036-284044_13TeV_Legacy2016_Collisions16_JSON.txt 
```

These are the old methods which might be deprecated.
```
brilcalc lumi -b "STABLE BEAMS" --normtag=/afs/cern.ch/user/l/lumipro/public/normtag_file/normtag_DATACERT.json -i Cert_271036-284044_13TeV_23Sep2016ReReco_Collisions16_JSON.txt -u /fb --begin 272785 --end 278809 &>lumi.BtoF &
brilcalc lumi -b "STABLE BEAMS" --normtag=/afs/cern.ch/user/l/lumipro/public/normtag_file/normtag_DATACERT.json -i Cert_271036-284044_13TeV_23Sep2016ReReco_Collisions16_JSON.txt -u /fb --begin 278819 --end 284042 &>lumi.GtoH &
```

# 2. Luminosity of (prescaled) triggers

One can also calculate effective luminosity of a prescaled trigger as
```
brilcalc lumi --normtag /cvmfs/cms-bril.cern.ch/cms-lumi-pog/Normtags/normtag_PHYSICS.json -u /fb -i Cert_271036-284044_13TeV_Legacy2016_Collisions16_JSON.txt --hltpath "HLT_PFJet200_*"
```
To run the command iteratively for several triggers, one can simply refer `run.sh` file.

