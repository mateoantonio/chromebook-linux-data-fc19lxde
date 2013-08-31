#!/bin/bash
# combine.sh

# combine files into: fc19minimal.tgz
# verify against: fc19minimal-sha1


tgt=fc19lxde.tgz

flist=`cat conf-filelist | xargs`

if [ -f $tgt ]; then rm $tgt ; fi

echo
echo "Combine xa* files into:  $tgt ..."

for x in $flist ; do 
    sha1sum -c $x-sha1
    if [ $? -ne 0 ]; then
        echo "Failed sha1sum at file $x"
        exit 1
    fi
    cat $x  >> $tgt
done

echo
echo "Check $tgt..."
sha1sum -c fc19lxde-sha1

