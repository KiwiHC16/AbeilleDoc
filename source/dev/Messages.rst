Format des messages inter démons
--------------------------------

Ce chapitre décrit le format des messages échangés entre démons.

RECOMMENDATIONS pour la suite: identifiant en minuscule puis majuscules (ex: srcAddr, type, startIndex...).

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

'Parser' vers 'Monitor' & 'Cmd' vers 'Monitor'
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Le moniteur collecte les messages envoyés vers et reçus de la zigate pour un équipement particulier et les affiches dans l'ordre.

    $msg = array(
        'type' => string, 'x2mon' or 'newaddr',
        'msg' => string, decoded msg if 'x2mon' type
        'addr' => hex string, new short addr if 'newaddr' type
    );

'SerialRead' vers 'Parser'
~~~~~~~~~~~~~~~~~~~~~~~~~~

    $msg = array(
        'src' = string, 'serialread',
        'type' => string, 'zigatemessage' or 'status',
            'zigatemessage': There is a zigate message attached in 'msg'
            'status': There is 'status' attached
        'net' => string, corresponding network (ex: 'Abeille1')
        'msg' => string, message from zigate (extracted from frame & transcoded)
        'status' => 'ready', 'notready'
    );

'parser' vers 'Abeille'
~~~~~~~~~~~~~~~~~~~~~~~

Le format décrit ci apres est appliqué progressivement.
Il concerne les fichiers "AbeilleParser.class.php" & "Abeille.class.php"

Ce format est completement flexible et permet de faire passer les infos variables reçues à chaque msg Zigbee.

La partie "commune" est

    $msg = array(
        'src' => 'parser',
        'type' => <msg_type>,
        'net' => $net,
    );

Exemples:
    $msg = array(
        'src' => 'parser',
        'type' => 'eqAnnounce',
        'net' => $net,
        'addr' => $addr,
        'ieee' => $eq['ieee'],
        'ep' => $eq['epFirst'],
        'jsonId' => $eq['jsonId'],
        'capa' => $eq['capa'],
        'time' => time()
    );

    $msg = array(
        'src' => 'parser',
        'type' => 'leaveIndication',
        'net' => $dest,
        'ieee' => $IEEE,
        'time' => time()
    );

    $msg = array(
        'src' => 'parser',
        'type' => 'attributReport',
        'net' => $dest,
        'addr' => $SrcAddr,
        'ep' => $EPoint,
        'name' => $ClusterId.'-'.$AttributId,
        'value' => false, // False = unsupported
        'time' => time(),
        'lqi' => $lqi
    );

'parser' vers 'cmd'
~~~~~~~~~~~~~~~~~~~

PAS ENCORE IMPLEMENTE !!
Juste à l'état de reflexion.

examples d'application:
    $this->msgToCmd("TempoCmd".$dest."/Ruche/ActiveEndPoint&time=".(time()+($i*2)), "address=".$Addr );
    $this->msgToCmd("Cmd".$dest."/Ruche/PDM", "req=E_SL_MSG_PDM_HOST_AVAILABLE_RESPONSE");
    $this->msgToCmd("Cmd".$dest."/Ruche/getManufacturerName", "address=".$SrcAddr.'&destinationEndPoint='.$EP );
    $this->msgToCmd('CmdAbeille1/'.$SrcAddr.'/IEEE_Address_request', 'shortAddress='.$SrcAddr);

    $msg = array(
        'src' = string, 'parser',
        'type' => string, 'cmd'/'delayed_cmd'
        'net' => string, corresponding network (ex: 'Abeille1')
        'addr' => hex string, equipement short address
        'ep' => ?, End Point
        'cmd' => string, command name (logical Id, part of those supported by target EQ itself)
        'payload' => string, payload/data
        'time' => ?, time for 'delayed_cmd'
    );
