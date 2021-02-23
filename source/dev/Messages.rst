Format des messages inter démons
--------------------------------

Ce chapitre décrit le format des messages échangés entre démons.

Parser vers 'LQI collector'
~~~~~~~~~~~~~~~~~~~~~~~~~~~

Pendant la collecte LQI, des requetes du type 004E sont envoyées aux équipements "routeur" et leur réponse 804E est décodée puis envoyée au "LQI collector".

Le format des messages est adapté aux infos à transférer::

    $msg = array(
        'Type' => string, '804E',
        'SrcAddr' => hex string, $SrcAddr,
        'TableEntries' => hex string, $NTableEntries,
        'TableListCount' => hex string, $NTableListCount,
        'StartIndex' => hex string, $StartIndex,
        'List' => list, $NList
            $N = array(
                "Addr"     => substr($payload, $j + 0, 4),
                "ExtPANId" => substr($payload, $j + 4, 16),
                "ExtAddr"  => substr($payload, $j + 20, 16),
                "Depth"    => substr($payload, $j + 36, 2),
                "LQI"      => substr($payload, $j + 38, 2),
                "BitMap"   => substr($payload, $j + 40, 2)
        )
    );
