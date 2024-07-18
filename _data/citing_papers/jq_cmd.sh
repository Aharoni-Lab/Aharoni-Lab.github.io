# jq '.[] | with_entries(select(.data.itemType == "attachment"))' example_zotero.json
# curl https://api.zotero.org/groups/4811862/collections/KRCY8EJ7/items/top\?limit\=100 -H "Authorization: Bearer BVerlgBfxxjADcqBYa7i2J67" > example_zotero.json
# LAST_VERSION=$(<last_modified_version)
# curl https://api.zotero.org/groups/4811862/collections/KRCY8EJ7/items/top\?limit\=1 -H "Authorization: Bearer BVerlgBfxxjADcqBYa7i2J67" -H "If-Modified-Since-Version: ${LAST_VERSION}" -D headers2.txt
# HTTP_CODE=$(grep HTTP/2 headers2.txt | cut -d" " -f 2)

curl https://api.zotero.org/groups/4811862/collections/KRCY8EJ7/items/top\?limit\=100 -D headers.txt -H "Authorization: Bearer BVerlgBfxxjADcqBYa7i2J67" > tmp_items_0.json
grep last-modified-version headers.txt | cut -d" " -f2 > last_modified_version

i=1
NEXT_LINK=$(ggrep -P '(?<=<)\S*?(?=>; rel="next")' headers.txt --only-matching)
while [ ! -z "${NEXT_LINK}" ]; do
	echo "${NEXT_LINK}"
 	curl "${NEXT_LINK}" -D headers.txt -H "Authorization: Bearer BVerlgBfxxjADcqBYa7i2J67" > tmp_items_${i}.json
	((i++))
	NEXT_LINK=$(ggrep -P '(?<=<)\S*?(?=>; rel="next")' headers.txt --only-matching)
done

jq -s '[.[][].data] | sort_by(.date) | reverse' tmp_items_*.json > items.json
rm tmp_items*


#jq '.[] | select(.data.itemType | IN("attachment", "group") | not)' example_zotero.json