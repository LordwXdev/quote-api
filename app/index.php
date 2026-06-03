<?php
header('Content-Type: application/json');

$quotes = [
    ["quote" => "The best way to predict the future is to create it.", "author" => "Abraham Lincoln"],
    ["quote" => "It does not matter how slowly you go as long as you do not stop.", "author" => "Confucius"],
    ["quote" => "Life is what happens when you're busy making other plans.", "author" => "John Lennon"],
    ["quote" => "The purpose of our lives is to be happy.", "author" => "Dalai Lama"],
    ["quote" => "Get busy living or get busy dying.", "author" => "Stephen King"],
    ["quote" => "You only live once, but if you do it right, once is enough.", "author" => "Mae West"],
    ["quote" => "In the end, it's not the years in your life that count.", "author" => "Abraham Lincoln"],
    ["quote" => "Never let the fear of striking out keep you from playing the game.", "author" => "Babe Ruth"],
    ["quote" => "Life is either a daring adventure or nothing at all.", "author" => "Helen Keller"],
    ["quote" => "You miss 100% of the shots you don't take.", "author" => "Wayne Gretzky"]
];

$random = $quotes[array_rand($quotes)];

echo json_encode([
    "quote"   => $random["quote"],
    "author"  => $random["author"],
    "pod"     => gethostname(),
    "pod_ip"  => $_SERVER["SERVER_ADDR"] ?? "unknown",
    "version" => "1.0.0"
], JSON_PRETTY_PRINT);
