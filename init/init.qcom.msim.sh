#!/vendor/bin/sh

model=`grep -aim1 'model:' /dev/block/by-name/LTALabel | sed -e 's/^.*model:[ ]*\([A-Za-z0-9-]*\).*$/\1/I'` 2> /dev/null

if [ "$model" = "" ]; then
    model=`grep -aEm1 '(A201SO|A204SO|SOG06|SOG09|SO-51C|SO-54C)&nbsp;' /dev/block/by-name/LTALabel 2> /dev/null | sed -nE 's/.*((A201SO|A204SO|SOG06|SOG09|SO-51C|SO-54C))&nbsp;.*/\1/p'`
fi

if [ "$model" = "" ]; then
    setprop vendor.radio.ltalabel.model "unknown"
else
    setprop vendor.radio.ltalabel.model "$model"
fi