<?php
// logout.php
require_once __DIR__ . '/includes/auth.php';

session_destroy();
header('Location: /SupportIT/login.php');
exit;
