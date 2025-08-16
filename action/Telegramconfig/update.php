<?php
include("../../Config/conect.php");

if (!isset($_POST['type'])) {
    http_response_code(400);
    echo json_encode(['status' => 'error', 'message' => 'Error: Type parameter is missing']);
    exit;
}

$type = $_POST['type'];

if ($type == "LeaveType") {
    $code = $_POST['code'] ?? '';
    $leaveType = $_POST['leaveType'] ?? '';
    $isded = (!empty($_POST['isded']) && ($_POST['isded'] == 1 || $_POST['isded'] === 'on')) ? 1 : 0;
    $isOverBalance = (!empty($_POST['isOverBalance']) && ($_POST['isOverBalance'] == 1 || $_POST['isOverBalance'] === 'on')) ? 1 : 0;
    $isProbation = (!empty($_POST['isProbation']) && ($_POST['isProbation'] == 1 || $_POST['isProbation'] === 'on')) ? 1 : 0;

    $stmt = $con->prepare("
        UPDATE lmleavetype 
        SET LeaveType = ?, IsDeduct = ?, IsOverBalance = ?, IsProbation = ?
        WHERE Code = ?
    ");
    $stmt->bind_param("siiis", $leaveType, $isded, $isOverBalance, $isProbation, $code);

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Record updated successfully']);
    } else {
        http_response_code(400);
        echo json_encode(['status' => 'error', 'message' => 'Error: ' . $stmt->error]);
    }
    $stmt->close();
} elseif ($type == "PublicHoliday") {
    $id = $_POST['id'] ?? '';
    $holiday_name = $_POST['holiday_name'] ?? '';
    $holiday_date = $_POST['holiday_date'] ?? '';
    $description = $_POST['description'] ?? '';

    $stmt = $con->prepare("
        UPDATE public_holidays 
        SET holiday_name = ?, holiday_date = ?, description = ?, updated_at = CURRENT_TIMESTAMP
        WHERE id = ?
    ");
    $stmt->bind_param("sssi", $holiday_name, $holiday_date, $description, $id);

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Public holiday updated successfully']);
    } else {
        http_response_code(400);
        echo json_encode(['status' => 'error', 'message' => 'Error: ' . $stmt->error]);
    }
    $stmt->close();
} elseif ($type == "TelegramConfig") {
    $id = $_POST['id'] ?? '';
    $chat_name = $_POST['chat_name'] ?? '';
    $chat_id = $_POST['chat_id'] ?? '';
    $bot_token = $_POST['bot_token'] ?? '';
    $description = $_POST['description'] ?? '';
    $status = isset($_POST['status']) ? (int)$_POST['status'] : 0;

    // Change column names to match DB (use lowercase if your DB uses lowercase)
    $stmt = $con->prepare("
        UPDATE sytelegram_config 
        SET chat_name = ?, chat_id = ?, bot_token = ?, description = ?, status = ?, updated_at = CURRENT_TIMESTAMP
        WHERE id = ?
    ");
    $stmt->bind_param("ssssii", $chat_name, $chat_id, $bot_token, $description, $status, $id);

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Telegram configuration updated successfully']);
    } else {
        http_response_code(400);
        echo json_encode(['status' => 'error', 'message' => 'Error: ' . $stmt->error]);
    }
    $stmt->close();
}

$con->close();
