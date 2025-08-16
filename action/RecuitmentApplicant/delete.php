<?php
include("../../Config/conect.php");
session_start();

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $sql = "DELETE FROM rcmapplicant WHERE ID = ?";
    $stmt = $con->prepare($sql);
    $stmt->bind_param("i", $id);
    if ($stmt->execute()) {
        $successMsg = urlencode("Applicant deleted successfully!");
        header("Location: ../../view/RecuitmentApplicant/index.php?success=$successMsg");
        exit;
    } else {
        $errorMsg = urlencode("Failed to delete applicant.");
        header("Location: ../../view/RecuitmentApplicant/index.php?error=$errorMsg");
        exit;
    }
}
header("Location: ../../view/RecuitmentApplicant/index.php");
exit;
?>
