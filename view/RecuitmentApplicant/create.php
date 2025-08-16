<?php
include("../../Config/conect.php");
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Recruitment Applicant</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- SweetAlert2 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="../../style/career.css" rel="stylesheet">
    <style>
        body { background: #f4f6fa; }
        .card { border-radius: 18px; box-shadow: 0 2px 16px rgba(44,62,80,0.07); }
        .form-label { font-weight: 500; }
        .required:after { content: " *"; color: #e74c3c; }
        .form-floating > .form-control, .form-floating > .form-select { height: 48px; }
        .form-floating textarea { height: 90px !important; }
        .btn-primary { background: #3b5bdb; border: none; }
        .btn-primary:hover { background: #274690; }
        @media (max-width: 767px) {
            .form-floating { margin-bottom: 1rem; }
        }
    </style>
</head>
<body>
    <div class="container-fluid mt-4">
        <div class="row">
            <div class="col-12">
                <div class="card shadow-sm">
                    <div class="card-header bg-white border-bottom-0">
                        <h4 class="mb-0">Create Recruitment Applicant</h4>
                    </div>
                    <div class="card-body">
                        <form id="applicantForm" action="../../action/RecuitmentApplicant/create.php" method="POST" novalidate autocomplete="off">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="AppId" class="form-label required">Applicant ID</label>
                                        <input type="text" class="form-control" id="AppId" name="AppId" maxlength="50" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="AppName" class="form-label required">Applicant Name</label>
                                        <input type="text" class="form-control" id="AppName" name="AppName" maxlength="100" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Gender" class="form-label required">Gender</label>
                                        <select class="form-select" id="Gender" name="Gender" required>
                                            <option value="">Select Gender</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                            <option value="Other">Other</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="ApplyPost" class="form-label required">Apply Position</label>
                                        <input type="text" class="form-control" id="ApplyPost" name="ApplyPost" maxlength="100" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Dob" class="form-label required">Date of Birth</label>
                                        <input type="date" class="form-control" id="Dob" name="Dob" required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Pob" class="form-label">Place of Birth</label>
                                        <input type="text" class="form-control" id="Pob" name="Pob" maxlength="100">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Education" class="form-label">Education</label>
                                        <textarea class="form-control" id="Education" name="Education" rows="2"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Experience" class="form-label">Experience</label>
                                        <textarea class="form-control" id="Experience" name="Experience" rows="2"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Remark" class="form-label">Remark</label>
                                        <textarea class="form-control" id="Remark" name="Remark" rows="2"></textarea>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Status" class="form-label required">Status</label>
                                        <select class="form-select" id="Status" name="Status" required>
                                            <option value="">Select Status</option>
                                            <option value="Pending">Pending</option>
                                            <option value="Reviewed">Reviewed</option>
                                            <option value="Rejected">Rejected</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="Recruited" class="form-label required">Recruited</label>
                                        <select class="form-select" id="Recruited" name="Recruited" required>
                                            <option value="0">No</option>
                                            <option value="1">Yes</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-end mt-2">
                                    <button type="submit" class="btn btn-primary px-4 py-2">
                                        <i class="fas fa-save me-2"></i>Submit Applicant
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        $(document).ready(function() {
            $('#applicantForm').on('submit', function(e) {
                e.preventDefault();
                if (!this.checkValidity()) {
                    e.stopPropagation();
                    $(this).addClass('was-validated');
                    return;
                }
                this.submit();
            });
            // Show error if present in URL
            const urlParams = new URLSearchParams(window.location.search);
            const errorMsg = urlParams.get('error');
            if (errorMsg) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: decodeURIComponent(errorMsg)
                });
            }
        });
    </script>
</body>
</html>