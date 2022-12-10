SELECT written_rep FROM entry
WHERE part_of_speech IS NOT NULL
AND part_of_speech IS NOT "abbreviation"
AND part_of_speech IS NOT "letter"
AND part_of_speech IS NOT "suffix"
AND part_of_speech IS NOT "affix"
AND part_of_speech IS NOT "prefix"
AND part_of_speech IS NOT "symbol"
AND part_of_speech IS NOT "infix"
AND part_of_speech IS NOT "proverb"
AND part_of_speech IS NOT "idiom"