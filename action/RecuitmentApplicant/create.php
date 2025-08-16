<?php
include("../../Config/conect.php");
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $AppId = trim($_POST['AppId'] ?? '');
    $AppName = trim($_POST['AppName'] ?? '');
    $Gender = trim($_POST['Gender'] ?? '');
    $ApplyPost = trim($_POST['ApplyPost'] ?? '');
    $Dob = trim($_POST['Dob'] ?? '');
    $Pob = trim($_POST['Pob'] ?? '');
    $Education = trim($_POST['Education'] ?? '');
    $Experience = trim($_POST['Experience'] ?? '');
    $Remark = trim($_POST['Remark'] ?? '');
    $Status = trim($_POST['Status'] ?? '');
    $Recruited = trim($_POST['Recruited'] ?? '0');

    // Basic validation
    if ($AppId === '' || $AppName === '' || $Gender === '' || $ApplyPost === '' || $Dob === '' || $Status === '') {
        $errorMsg = urlencode('Please fill in all required fields.');
        header("Location: ../../view/RecuitmentApplicant/create.php?error=$errorMsg");
        exit;
    }

    $sql = "INSERT INTO rcmapplicant (AppId, AppName, Gender, ApplyPost, Education, Pob, Dob, Experience, Remark, Status, Recruited) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $con->prepare($sql);
    $stmt->bind_param(
        "ssssssssssi",
        $AppId,
        $AppName,
        $Gender,
        $ApplyPost,
        $Education,
        $Pob,
        $Dob,
        $Experience,
        $Remark,
        $Status,
        $Recruited
    );
    if ($stmt->execute()) {
        $successMsg = urlencode('Applicant created successfully!');
        header("Location: ../../view/RecuitmentApplicant/index.php?success=$successMsg");
        exit;
    } else {
        $errorMsg = urlencode('Failed to create applicant.');
        header("Location: ../../view/RecuitmentApplicant/create.php?error=$errorMsg");
        exit;
    }
}
header("Location: ../../view/RecuitmentApplicant/create.php");
exit;
