#helei0908@hotmail.com
FFMPEG=ffmpeg
$FFMPEG -version || exit

FFCMD="ffcmd.source"
FFCMD_BASE="ffcmd_base.source"
en_file="en.tmp"
de_file="de.tmp"
filter_file="filter.tmp"
opt_file="opt.tmp"
fmt_file="fmt.tmp"

${FFMPEG} -encoders > ${en_file}
${FFMPEG} -decoders > ${de_file}
${FFMPEG} -filters > ${filter_file}
${FFMPEG} -h > ${opt_file}
${FFMPEG} -formats > ${fmt_file}
RET=()
_read()
{
        RET=()
        local i=$2;
        while read line
        do
               if [ $i != 0 ];then
                        ((i=$i-1));
                        continue;
                fi  
                if [[ "$4x" = "x" ||  "$line" =~ $4 ]]; then
                        arr=($line)
                        RET=(${RET[@]} ${arr[$3]})
                fi  
        done < $1
}

_opt()
{
        RET=()
        local i=$2;
        while read line
        do
               if [ $i != 0 ];then
                        ((i=$i-1));
                        continue;
                fi  
                if [[ "$4x" = "x" ||  "$line" =~ $4 ]]; then
                        arr=($line)
                        RET=(${RET[@]} ${arr[$3]})
                fi  
        done < $1

}
_read "${en_file}" 10 1 "^V"
EN_V=${RET[@]}


_read "${en_file}" 10 1 "^A"
EN_A=${RET[@]}


_read "${en_file}" 10 1 "^S"
EN_S=${RET[@]}

_read "${de_file}" 10 1 "^V"
DE_V=${RET[@]}


_read "${de_file}" 10 1 "^A"
DE_A=${RET[@]}


_read "${de_file}" 10 1 "^S"
DE_S=${RET[@]}

_read "${filter_file}" 8 1
FILTERS=${RET[@]}

_opt "$opt_file" 0 0 "^-"
OPTS=${RET[@]}

_read "$fmt_file" 3 1 "^D"
FMT_DEMUX=${RET[@]}

_read "$fmt_file" 3 1 "^E"
FMT_MUX=${RET[@]}

#rm ${en_file}
#rm ${de_file}
#rm ${filter_file}
#rm ${opt_file}
#rm ${fmt_file}

rm $FFCMD
echo "#helei0908#hotmail.com" > $FFCMD
echo "" >> $FFCMD
echo "Encoders:"
echo "${EN_V[@]} ${EN_A[@]} ${EN_S[@]}"
echo "export EN_V=\"${EN_V[@]}\"" >> $FFCMD
echo "export EN_A=\"${EN_A[@]})\"" >> $FFCMD
echo "export EN_S=\"${EN_S[@]})\"" >> $FFCMD

echo "Decoders:"
echo "${DE_V[@]} ${DE_A[@]} $(DE_S[@])"
echo "export DE_V=\"${DE_V[@]}\"" >> $FFCMD
echo "export DE_A=\"${DE_A[@]}\"" >> $FFCMD
echo "export DE_S=\"${DE_S[@]}\"" >> $FFCMD

echo "Filters:"
echo "${FILTERS[@]}"
echo "export FILTERS=\"${FILTERS[@]}\"" >> $FFCMD

echo "Options:"
echo "${OPTS[@]}"
echo "export OPTS=\"${OPTS[@]}\"" >> $FFCMD

echo "Formats:"
echo "${FMT_DEMUX[@]} ${FMT_MUX[@]}"
echo "export FMT_DEMUX=\"${FMT_DEMUX[@]}\"" >> $FFCMD
echo "export FMT_MUX=\"${FMT_MUX[@]}\"" >> $FFCMD

cat $FFCMD_BASE >> $FFCMD
