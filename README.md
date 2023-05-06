# LaUrDal (Laudationes urbium Dalmaticarum) - LiLa (Linking Latin) #

TEI XML encoded Latin texts from the Laudationes urbium Dalmaticarum collection, freely available under a [CC-BY license](LICENSE.md).

A sample to show database interaction with LiLa.

## Contents ##

* The TEI XML texts are in [txts](/txts) directory
* XQuery scripts to create database and transform the files are in [xqscripts](/xqscripts)

## Encoding conventions ##

* The texts are tokenized into sentences (`s`; in poetry, the verse breaks are removed) and words (`w`; the enclitics such as *genusque* are presented as `w` children of `w` parent annotated with `ana="enclisis"` while the enclitic is encoded with `@join="left"` attribute value)
* The words are normalized (using the `@norm` attribute)
* LiLa URIs are added as `@lemmaRef` attribute values; when a word is missing in LiLa, the `@lemmaRef` value points to Logeion

## How to use ##

* Download the files or clone the repository.
* Install BaseX (or other XML database)

1. From BaseX, open and run the script [create-laurdal-db.xq](/xqscripts/create-laurdal-db.xq) to create the XML database `laurdal-lila`; open the database and inspect it to see that there are no `@lemma` attributes in `w` elements
2. Close the `laurdal-lila` database
2. From Basex, open and run the script [query-lila.xq](/xqscripts/query-lila.xq); the script will add `@lemma` attributes to each `w` element in the `laurdal-lila` database; the attribute values are added by querying LiLa online, using the LiLa URIs (for three short files, the script takes 43052.4 ms to execute on my machine)
3. From BaseX, open the `laurdal-lila` database, inspect it (you should see new `@lemma` attributes with their values) or export the updated files into any directory

### Editor ###

* Neven Jovanović (nevenjovanovic), Department of Classical Philology, Faculty of Humanities and Social Sciences, University of Zagreb; [orcid.org/0000-0002-9119-399X](http://orcid.org/0000-0002-9119-399X)
