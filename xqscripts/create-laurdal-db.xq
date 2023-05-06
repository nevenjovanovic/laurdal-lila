(: create DB laurdal-lila from files tokenized into sentences and words :)
let $parent := replace(file:parent(static-base-uri()), '/xqscripts/', '') 
let $path := $parent || "/txts/" 
return db:create("laurdal-lila", $path, (), map { 'ftindex': true(), 'intparse' : true(), 'autooptimize' : true(), 'updindex' : true() })