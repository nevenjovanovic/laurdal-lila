(: query LiLa for a description of lemma ID :)
(: update database contents with lemma from LiLa, as value of @lemma :)

(: declare namespace for XML RDF result we get from LiLa :)
declare namespace rdfs="http://www.w3.org/2000/01/rdf-schema#";
declare namespace tei="http://www.tei-c.org/ns/1.0";

(: function which does the work :)
declare function local:qlila($l){ 
let $url := ("QSTRING?output=application%2Frdf%2Bxml") 
let $query := replace($url, "QSTRING", string($l))
let $parsed := (doc($query))
return $parsed//rdfs:label/string()
};

(: the script using the function :)
let $dbname := "laurdal-lila"
let $list := db:get($dbname)//tei:w[starts-with(@lemmaRef, "http://lila-erc.eu")]
for $w in $list
let $ref := $w/@lemmaRef/string()
let $l := replace($ref, "http:", "https:")
let $lem := local:qlila($l)
let $attrname := "lemma"
return insert node attribute { $attrname } { $lem } into $w
