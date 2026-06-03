<?php
header('Content-Type: application/json');

// Burns CPU so the HPA has something to react to
$result = 0;
for ($i = 0; $i < 500000; $i++) {
    $result += $i * $i;
}

echo json_encode([
    "status" => "done",
    "pod"    => gethostname(),
    "result" => $result
], JSON_PRETTY_PRINT);
