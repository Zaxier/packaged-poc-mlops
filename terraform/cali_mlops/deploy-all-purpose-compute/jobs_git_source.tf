resource "databricks_job" "data_setup_git" {
  name = "${var.project_name}--data_setup_job--git_source--${var.env}"

  git_source {
    provider = var.git_provider
    url = var.repo_url
    branch = var.git_branch
  }

  task {
    task_key = "taskA--data_cleanup"
    existing_cluster_id = databricks_cluster.all_purpose_cluster.id


    notebook_task {
      notebook_path = "notebooks/_cali_mlops_data_generator/data_cleanup"
      base_parameters = tomap({
          env = var.env
      })
    }
  }

  task {
    task_key = "taskB--data_setup"
    depends_on {
      task_key = "taskA--data_cleanup"
    }
    existing_cluster_id = databricks_cluster.all_purpose_cluster.id

    notebook_task {
      notebook_path = "notebooks/_cali_mlops_data_generator/data_setup"
      base_parameters = tomap({
          env = var.env
      })
    }

  }

  email_notifications {
    on_success = [data.databricks_current_user.me.user_name]
    on_failure = [data.databricks_current_user.me.user_name]
  }


}

resource "databricks_job" "propval_model_train_git" {
  name = "${var.project_name}--propval_model_train_git_job--${var.env}"
  existing_cluster_id = databricks_cluster.all_purpose_cluster.id

  git_source {
    provider = var.git_provider
    url = var.repo_url
    branch = var.git_branch
  }

  notebook_task {
    notebook_path = "notebooks/cali_mlops/propval_model_train"
    base_parameters = tomap({
        env = var.env
    })
  }
  
  email_notifications {
    on_success = [data.databricks_current_user.me.user_name]
    on_failure = [data.databricks_current_user.me.user_name]
  }

}

resource "databricks_job" "propval_model_deployment_git" {
  name = "${var.project_name}--propval_model_deployment_git_job--${var.env}"
  existing_cluster_id = databricks_cluster.all_purpose_cluster.id

  git_source {
    provider = var.git_provider
    url = var.repo_url
    branch = var.git_branch
  }

  notebook_task {
    notebook_path = "notebooks/cali_mlops/propval_model_deployment"
    base_parameters = tomap({
        env = var.env
    })
  }
  
  email_notifications {
    on_success = [data.databricks_current_user.me.user_name]
    on_failure = [data.databricks_current_user.me.user_name]
  }

}

resource "databricks_job" "propval_model_inference_batch_git" {
  name = "${var.project_name}--propval_model_inference_batch_git_job--${var.env}"
  existing_cluster_id = databricks_cluster.all_purpose_cluster.id

  git_source {
    provider = var.git_provider
    url = var.repo_url
    branch = var.git_branch
  }

  notebook_task {
    notebook_path = "notebooks/cali_mlops/propval_model_inference_batch"
    base_parameters = tomap({
        env = var.env
    })
  }
  
  email_notifications {
    on_success = [data.databricks_current_user.me.user_name]
    on_failure = [data.databricks_current_user.me.user_name]
  }

}

resource "databricks_job" "wineclassif_model_train_git" {
  name = "${var.project_name}--wineclassif_model_train_git_job--${var.env}"
  existing_cluster_id = databricks_cluster.all_purpose_cluster.id

  git_source {
    provider = var.git_provider
    url = var.repo_url
    branch = var.git_branch
  }

  notebook_task {
    notebook_path = "notebooks/cali_mlops/wineclassif_model_train"
    base_parameters = tomap({
        env = var.env
    })
  }
  
  email_notifications {
    on_success = [data.databricks_current_user.me.user_name]
    on_failure = [data.databricks_current_user.me.user_name]
  }

}

resource "databricks_job" "wineclassif_model_deployment_git" {
  name = "${var.project_name}--wineclassif_model_deployment_git_job--${var.env}"
  existing_cluster_id = databricks_cluster.all_purpose_cluster.id

  git_source {
    provider = var.git_provider
    url = var.repo_url
    branch = var.git_branch
  }

  notebook_task {
    notebook_path = "notebooks/cali_mlops/wineclassif_model_deployment"
    base_parameters = tomap({
        env = var.env
    })
  }
  
  email_notifications {
    on_success = [data.databricks_current_user.me.user_name]
    on_failure = [data.databricks_current_user.me.user_name]
  }

}

resource "databricks_job" "wineclassif_model_inference_batch_git" {
  name = "${var.project_name}--wineclassif_model_inference_batch_git_job--${var.env}"
  existing_cluster_id = databricks_cluster.all_purpose_cluster.id

  git_source {
    provider = var.git_provider
    url = var.repo_url
    branch = var.git_branch
  }

  notebook_task {
    notebook_path = "notebooks/cali_mlops/wineclassif_model_inference_batch"
    base_parameters = tomap({
        env = var.env
    })
  }
  
  email_notifications {
    on_success = [data.databricks_current_user.me.user_name]
    on_failure = [data.databricks_current_user.me.user_name]
  }

}

resource "databricks_job" "e2e_job_git" {
  name = "${var.project_name}--e2e_job--git_source--${var.env}"

  git_source {
    provider = var.git_provider
    url = var.repo_url
    branch = var.git_branch
  }

  task {
    task_key = "taskA--data_cleanup"
    existing_cluster_id = databricks_cluster.all_purpose_cluster.id


    notebook_task {
      notebook_path = "notebooks/_cali_mlops_data_generator/data_cleanup"
      base_parameters = tomap({
          env = var.env
      })
    }
  }

  task {
    task_key = "taskB--data_setup"
    depends_on {
      task_key = "taskA--data_cleanup"
    }
    existing_cluster_id = databricks_cluster.all_purpose_cluster.id

    notebook_task {
      notebook_path = "notebooks/_cali_mlops_data_generator/data_setup"
      base_parameters = tomap({
          env = var.env
      })
    }
  }

  task {
    task_key = "taskC1--propval_model_train"
    depends_on {
      task_key = "taskB--data_setup"
    }
    existing_cluster_id = databricks_cluster.all_purpose_cluster.id

    notebook_task {
      notebook_path = "notebooks/cali_mlops/propval_model_train"
      base_parameters = tomap({
          env = var.env
      })
    }
  }

  task {
    task_key = "taskD1--propval_model_deployment"
    depends_on {
      task_key = "taskC1--propval_model_train"
    }
    existing_cluster_id = databricks_cluster.all_purpose_cluster.id

    notebook_task {
      notebook_path = "notebooks/cali_mlops/propval_model_deployment"
      base_parameters = tomap({
          env = var.env
      })
    }
  } 

  task {
    task_key = "taskE1--propval_model_inference_batch"
    depends_on {
      task_key = "taskD1--propval_model_deployment"
    }
    existing_cluster_id = databricks_cluster.all_purpose_cluster.id

    notebook_task {
      notebook_path = "notebooks/cali_mlops/propval_model_inference_batch"
      base_parameters = tomap({
          env = var.env
      })
    }
  }

  task {
    task_key = "taskC2--wineclassif_model_train"
    depends_on {
      task_key = "taskB--data_setup"
    }
    existing_cluster_id = databricks_cluster.all_purpose_cluster.id

    notebook_task {
      notebook_path = "notebooks/cali_mlops/wineclassif_model_train"
      base_parameters = tomap({
          env = var.env
      })
    }
  }

  task {
    task_key = "taskD2--wineclassif_model_deployment"
    depends_on {
      task_key = "taskC2--wineclassif_model_train"
    }
    existing_cluster_id = databricks_cluster.all_purpose_cluster.id

    notebook_task {
      notebook_path = "notebooks/cali_mlops/wineclassif_model_deployment"
      base_parameters = tomap({
          env = var.env
      })
    }
  } 

  task {
    task_key = "taskE2--wineclassif_model_inference_batch"
    depends_on {
      task_key = "taskD2--wineclassif_model_deployment"
    }
    existing_cluster_id = databricks_cluster.all_purpose_cluster.id

    notebook_task {
      notebook_path = "notebooks/cali_mlops/wineclassif_model_inference_batch"
      base_parameters = tomap({
          env = var.env
      })
    }
  }



  email_notifications {
    on_success = [data.databricks_current_user.me.user_name]
    on_failure = [data.databricks_current_user.me.user_name]
  }

}
