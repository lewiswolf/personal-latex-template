/*
This file contains scripts used in conjunction with the Better BibTex package for Zotero.
For information on installing these scripts, see here =>
	https://retorque.re/zotero-better-bibtex/exporting/scripting/
*/

// add url and urldate to webpage citations
if (Translator.BetterBibTeX && item.itemType === 'webpage') {
	reference.remove('howpublished')
	if (item.url) {
		reference.add({
			name: 'url',
			bibtex: `{${reference.enc_verbatim({ value: item.url })}}`,
		})
	}
	if (item.accessDate) {
		reference.add({
			name: 'urldate',
			bibtex: `{${item.accessDate.replace(/\s*T?\d+:\d+:\d+.*/, '')}}`,
		})
	}
}