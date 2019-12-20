xquery version "1.0-ml";

module namespace mapping = "http://creditsuisse.com/mapping";

declare namespace es  = "http://marklogic.com/entity-services";
declare namespace csp = "com.credit-suisse.research.publisher.digital";
declare namespace meta="com.credit-suisse.research.publisher.meta";
declare namespace secu="com.credit-suisse.research.publisher.secdata";

declare function mapping:mapDoc($data as node()
) as node() {
     element {"document"} {
         element {"volume"}{
             element {"indexing"} {
                 element {"taxonomies"} {},
                 element {"securities"} {$data/csp:document/secu:securitiesData/Securities/*}

             },
             element {"sections"} {($data/csp:document/csp:leader,$data/csp:document/csp:body)},
             element {"appendices"} {
                 element {"appendix"} {
                     element {"active"} {$data/csp:document/csp:disclaimer}
                 }
             }
         },
         element {"appendix"} {
             element {"disclaimer"} {}
         }
     }
};

declare function mapping:mapHeader($data as node()
) as node()* {
    (
            $data/csp:document/meta:system,
            $data/csp:document/meta:data/meta:blastEmail,
            $data/csp:document/meta:data/meta:docId,
            $data/csp:document/meta:data/meta:language,
            $data/csp:document/meta:data/meta:docUrl)

};