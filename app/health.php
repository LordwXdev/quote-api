<?php
header('Content-Type: application/json');

$action = $_GET['action'] ?? 'live';

if ($action === 'ready') {
    // Simulate a short warmup window
    $start = filemtime(__FILE__);
    $uptime = time() - $start;
    if ($uptime < 3) {
        http_response_code(503);
        echo json_encode(["status" => "not ready", "uptime" => $uptime]);
        exit;
    }
}

http_response_code(200);
echo json_encode(["status" => "ok"]);
