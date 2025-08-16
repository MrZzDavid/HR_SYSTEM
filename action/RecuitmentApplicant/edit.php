<?php
include("../../Config/conect.php");
session_start();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $ID = intval($_POST['ID'] ?? 0);
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

    if ($ID <= 0 || $AppId === '' || $AppName === '' || $Gender === '' || $ApplyPost === '' || $Dob === '' || $Status === '') {
        $errorMsg = urlencode('Please fill in all required fields.');
        header("Location: ../../view/RecuitmentApplicant/edit.php?id=$ID&error=$errorMsg");
        exit;
    }

    $sql = "UPDATE rcmapplicant SET AppId=?, AppName=?, Gender=?, ApplyPost=?, Education=?, Pob=?, Dob=?, Experience=?, Remark=?, Status=?, Recruited=? WHERE ID=?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param(
        "ssssssssssii",
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
        $Recruited,
        $ID
    );
    if ($stmt->execute()) {
        $successMsg = urlencode('Applicant updated successfully!');
        header("Location: ../../view/RecuitmentApplicant/index.php?success=$successMsg");
        exit;
    } else {
        $errorMsg = urlencode('Failed to update applicant.');
        header("Location: ../../view/RecuitmentApplicant/edit.php?id=$ID&error=$errorMsg");
        exit;
    }
}
header("Location: ../../view/RecuitmentApplicant/index.php");
exit;
