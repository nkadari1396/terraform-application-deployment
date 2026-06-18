locals {
    resource_name = "${var.project_name}-{var.environment}"
    az_names = var.az_names
    sg_final_name = "${var.project_name}-${var.environment}-${var.sg_name}"
}