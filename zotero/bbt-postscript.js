/*
This file contains scripts used in conjunction with the Better BibTex package for Zotero.
For information on installing these scripts, see here =>
	https://retorque.re/zotero-better-bibtex/exporting/scripting/
*/

if (Translator.BetterBibTeX) {
	switch (item.itemType) {
		// add url and urldate to webpage citations
		case 'webpage':
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
		// format a video recording
		case 'videoRecording':
			// merge producer and director fields
			for (const creator of item.creators) {
				creator.creatorType = creator.creatorType === 'director'
					|| creator.creatorType === 'producer'
					? 'director' // not sure why, but author did not work here
					: content.creatorType
			}
			reference.addCreators()
			// add format
			if (item.medium) {
				reference.add({
					name: 'type',
					bibtex: `{${item.medium}}`,
				})
			}
			// add url and urldate
			if (item.url && item.accessDate) {
				reference.add({
					name: 'url',
					bibtex: `{${reference.enc_verbatim({ value: item.url })}}`,
				})
				reference.add({
					name: 'urldate',
					bibtex: `{${item.accessDate.replace(/\s*T?\d+:\d+:\d+.*/, '')}}`,
				})
			}
		// do nothing if default case
		default:
			break
	}
}
