<?php
include("../../Config/conect.php");
session_start();

if (!isset($_GET['id']) || empty($_GET['id'])) {
    header("Location: index.php");
    exit();
}

$id = intval($_GET['id']);
$sql = "SELECT * FROM rcmapplicant WHERE ID = ?";
$stmt = $con->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$applicant = $result->fetch_assoc();
$stmt->close();

if (!$applicant) {
    header("Location: index.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Recruitment Applicant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="../../style/career.css" rel="stylesheet">
    <style>
        body { background: #f4f6fa; }
        .card { border-radius: 18px; box-shadow: 0 2px 16px rgba(44,62,80,0.07); }
        .form-label { font-weight: 500; }
        .required:after { content: " *"; color: #e74c3c; }
    </style>
</head>
<body>
    <div class="container-fluid mt-4">
        <div class="row">
            <div class="col-12">
                <div class="card shadow-sm">
                    <div class="card-header bg-white border-bottom-0">
                        <h4 class="mb-0">Edit Recruitment Applicant</h4>
                    </div>
                    <div class="card-body">
                        <form id="editApplicantForm" action="../../action/RecuitmentApplicant/edit.php" method="POST" novalidate autocomplete="off">
                            <input type="hidden" name="ID" value="<?php echo htmlspecialchars($applicant['ID']); ?>">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="AppId" class="form-label required">Applicant ID</label>
                                        <input type="text" class="form-control" id="AppId" name="AppId" maxlength="50" value="<?php echo htmlspecialchars($applicant['AppId']); ?>" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="AppName" class="form-label required">Applicant Name</label>
                                        <input type="text" class="form-control" id="AppName" name="AppName" maxlength="100" value="<?php echo htmlspecialchars($applicant['AppName']); ?>" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Gender" class="form-label required">Gender</label>
                                        <select class="form-select" id="Gender" name="Gender" required>
                                            <option value="">Select Gender</option>
                                            <option value="Male" <?php if($applicant['Gender']==='Male') echo 'selected'; ?>>Male</option>
                                            <option value="Female" <?php if($applicant['Gender']==='Female') echo 'selected'; ?>>Female</option>
                                            <option value="Other" <?php if($applicant['Gender']==='Other') echo 'selected'; ?>>Other</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="ApplyPost" class="form-label required">Apply Position</label>
                                        <input type="text" class="form-control" id="ApplyPost" name="ApplyPost" maxlength="100" value="<?php echo htmlspecialchars($applicant['ApplyPost']); ?>" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Dob" class="form-label required">Date of Birth</label>
                                        <input type="date" class="form-control" id="Dob" name="Dob" value="<?php echo htmlspecialchars($applicant['Dob']); ?>" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Pob" class="form-label">Place of Birth</label>
                                        <input type="text" class="form-control" id="Pob" name="Pob" maxlength="100" value="<?php echo htmlspecialchars($applicant['Pob']); ?>">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Education" class="form-label">Education</label>
                                        <textarea class="form-control" id="Education" name="Education" rows="2"><?php echo htmlspecialchars($applicant['Education']); ?></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Experience" class="form-label">Experience</label>
                                        <textarea class="form-control" id="Experience" name="Experience" rows="2"><?php echo htmlspecialchars($applicant['Experience']); ?></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Remark" class="form-label">Remark</label>
                                        <textarea class="form-control" id="Remark" name="Remark" rows="2"><?php echo htmlspecialchars($applicant['Remark']); ?></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Status" class="form-label required">Status</label>
                                        <select class="form-select" id="Status" name="Status" required>
                                            <option value="">Select Status</option>
                                            <option value="Pending" <?php if($applicant['Status']==='Pending') echo 'selected'; ?>>Pending</option>
                                            <option value="Reviewed" <?php if($applicant['Status']==='Reviewed') echo 'selected'; ?>>Reviewed</option>
                                            <option value="Rejected" <?php if($applicant['Status']==='Rejected') echo 'selected'; ?>>Rejected</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Recruited" class="form-label required">Recruited</label>
                                        <select class="form-select" id="Recruited" name="Recruited" required>
                                            <option value="0" <?php if($applicant['Recruited']==0) echo 'selected'; ?>>No</option>
                                            <option value="1" <?php if($applicant['Recruited']==1) echo 'selected'; ?>>Yes</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-end mt-2">
                                    <button type="submit" class="btn btn-primary px-4 py-2">
                                        <i class="fas fa-save me-2"></i>Update Applicant
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        $(document).ready(function() {
            $('#editApplicantForm').on('submit', function(e) {
                e.preventDefault();
                if (!this.checkValidity()) {
                    e.stopPropagation();
                    $(this).addClass('was-validated');
                    return;
                }
                this.submit();
            });
        });
    </script>
</body>
</html>