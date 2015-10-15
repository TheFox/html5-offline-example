<?php

$d = new DateTime();

header('Content-Type: application/json');
print json_encode(array(
	'date' => $d->format('Y-m-d H:i:s'),
));
