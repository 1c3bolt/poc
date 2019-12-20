xquery version "1.0-ml";

import module namespace trgr='http://marklogic.com/xdmp/triggers' at '/MarkLogic/triggers.xqy';


declare option xdmp:mapping "false";
declare variable $trgr:uri as xs:string external;

(
    xdmp:document-remove-permissions($trgr:uri,(xdmp:permission("draft-access","read"))),
    xdmp:document-add-permissions($trgr:uri,((xdmp:permission("final-access","read"))))
)
