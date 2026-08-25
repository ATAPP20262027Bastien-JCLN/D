<?php

$users = [
    ['Alice', 'alice@example.com', 'Alice123!', 1],
    ['Bob', 'bob@example.com', 'Bob123!', 2],
    ['Charlie', 'charlie@example.com', 'Charlie123!', 3],
];

echo "INSERT INTO users (name, email, password_hash, id_role) VALUES\n";

$values = [];

foreach ($users as [$name, $email, $password, $id_role]) {
    $hash = password_hash($password, PASSWORD_BCRYPT);

    $values[] = sprintf(
        "('%s', '%s', '%s', %d)",
        $name,
        $email,
        $hash,
        $id_role
    );
}

echo implode(",\n", $values) . ";\n";