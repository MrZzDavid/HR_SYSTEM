<?php
include("../../Config/conect.php");
header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    try {
        $id          = intval($_POST['id']);
        $description = $_POST['description'];

        // Convert to MySQL date format
        $fromDate = date('Y-m-d', strtotime($_POST['fromDate']));
        $toDate   = date('Y-m-d', strtotime($_POST['toDate']));

        $hourPerDay = floatval($_POST['hour_per_day']);
        $workDay    = floatval($_POST['work_day']);
        $hourPerWeek = $hourPerDay * $workDay;

        // Checkboxes
        $mon = isset($_POST['mon']) ? 1 : 0;
        $tue = isset($_POST['tue']) ? 1 : 0;
        $wed = isset($_POST['wed']) ? 1 : 0;
        $thu = isset($_POST['thu']) ? 1 : 0;
        $fri = isset($_POST['fri']) ? 1 : 0;
        $sat = isset($_POST['sat']) ? 1 : 0;
        $sun = isset($_POST['sun']) ? 1 : 0;

        // Hours per day
        $monHours = isset($_POST['mon_hours']) ? intval($_POST['mon_hours']) : 8;
        $tueHours = isset($_POST['tue_hours']) ? intval($_POST['tue_hours']) : 8;
        $wedHours = isset($_POST['wed_hours']) ? intval($_POST['wed_hours']) : 8;
        $thuHours = isset($_POST['thu_hours']) ? intval($_POST['thu_hours']) : 8;
        $friHours = isset($_POST['fri_hours']) ? intval($_POST['fri_hours']) : 8;
        $satHours = isset($_POST['sat_hours']) ? intval($_POST['sat_hours']) : 8;
        $sunHours = isset($_POST['sun_hours']) ? intval($_POST['sun_hours']) : 8;

        // SQL update
        $sql = "UPDATE prpaypolicy SET
            description = ?, 
            fromDate = ?,
            toDate = ?,
            workday = ?,
            hourperday = ?,
            hourperweek = ?,
            mon = ?,
            monHours = ?,
            tues = ?, 
            tueHours = ?, 
            wed = ?,
            wedHours = ?,
            thur = ?, 
            thuHours = ?, 
            fri = ?,
            friHours = ?,
            sat = ?,
            satHours = ?,
            sun = ?,
            sunHours = ?
            WHERE id = ?";

        $stmt = $con->prepare($sql);
        if (!$stmt) {
            throw new Exception("Prepare failed: " . $con->error);
        }

        $stmt->bind_param(
            "sssddiiiiiiiiiiiiiiii",
            $description,
            $fromDate,
            $toDate,
            $workDay,
            $hourPerDay,
            $hourPerWeek,
            $mon,
            $monHours,
            $tue,
            $tueHours,
            $wed,
            $wedHours,
            $thu,
            $thuHours,
            $fri,
            $friHours,
            $sat,
            $satHours,
            $sun,
            $sunHours,
            $id
        );

        if (!$stmt->execute()) {
            throw new Exception("Execute failed: " . $stmt->error);
        }

        echo json_encode(['status' => 'success', 'message' => 'Policy updated successfully']);
        $stmt->close();
    } catch (Exception $e) {
        error_log("Error in update.php: " . $e->getMessage());
        echo json_encode(['status' => 'error', 'message' => 'Error updating policy: ' . $e->getMessage()]);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'Invalid request method']);
}

$con->close();
