<?php
include("../../Config/conect.php");
session_start();

if (!isset($_GET['id']) || empty($_GET['id'])) {
    header("Location: ../../view/RecuitmentOnboarding/index.php");
    exit();
}

$id = intval($_GET['id']);
$sql = "SELECT * FROM rcmapplicant WHERE ID = ? AND Recruited = 1";
$stmt = $con->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$applicant = $result->fetch_assoc();
$stmt->close();

if (!$applicant) {
    $errorMsg = urlencode('Applicant not found or not recruited.');
    header("Location: ../../view/RecuitmentOnboarding/index.php?error=$errorMsg");
    exit();
}

// Check for duplicate in hrstaffprofile (by EmpName and Dob)
$checkSql = "SELECT * FROM hrstaffprofile WHERE EmpName = ? AND Dob = ?";
$checkStmt = $con->prepare($checkSql);
$checkStmt->bind_param("ss", $applicant['AppName'], $applicant['Dob']);
$checkStmt->execute();
$checkResult = $checkStmt->get_result();
if ($checkResult->num_rows > 0) {
    $errorMsg = urlencode('This applicant is already onboarded to HR Staff Profile.');
    header("Location: ../../view/RecuitmentOnboarding/index.php?error=$errorMsg");
    exit();
}
$checkStmt->close();

// Generate a unique EmpCode (e.g., EMP + timestamp)
$empCode = 'EMP' . time();

// Insert into hrstaffprofile (only columns that exist)
$sqlInsert = "INSERT INTO hrstaffprofile (EmpCode, EmpName, Gender, Dob, Status) VALUES (?, ?, ?, ?, 'Active')";
$stmtInsert = $con->prepare($sqlInsert);
$stmtInsert->bind_param(
    "ssss",
    $empCode,
    $applicant['AppName'],
    $applicant['Gender'],
    $applicant['Dob']
);
if ($stmtInsert->execute()) {
    // Mark applicant as onboarded (add a new column if needed, here we use Remark)
    $update = $con->prepare("UPDATE rcmapplicant SET Remark = CONCAT(IFNULL(Remark,''), '[ONBOARDED]') WHERE ID = ?");
    $update->bind_param("i", $id);
    $update->execute();
    $successMsg = urlencode('Applicant onboarded to HR Staff Profile!');
    header("Location: ../../view/RecuitmentOnboarding/index.php?success=$successMsg");
    exit();
} else {
    $errorMsg = urlencode('Failed to onboard applicant.');
    header("Location: ../../view/RecuitmentOnboarding/index.php?error=$errorMsg");
    exit();
}
?>
